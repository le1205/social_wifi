//
//  ScanView.swift
//  social_wifi
//
//  Created by BigBright on 11/20/23.
//

import SwiftUI
import Foundation

import CoreLocation

struct ScanView: View {
    @State private var gotoHome: Bool = false
    @State private var clicked = false
    @StateObject private var locationManager = LocationManager()
    @State private var nearbyUsers = [ScanModel]()

    func baseOverlayColor(height: CGFloat) -> Color {
            Color(red: 5/255, green: 30/255, blue: 88/255, opacity: 0.68)
        }
    var body: some View {
        VStack{
            Spacer()
            Text("Searching for people near you...")
                .foregroundColor(Color(red: 63/255, green: 49/255, blue: 120/255))
                .font(.system(size: 16, weight: .bold))
            Spacer()
            ZStack{
                CustomCircle(width: 465, height: 465, overlayColor: clicked ? Color(red: 5/255, green: 30/255, blue: 88/255, opacity: 0.68) : baseOverlayColor(height: 465))
                CustomCircle(width: 345, height: 345, overlayColor: clicked ? Color(red: 5/255, green: 30/255, blue: 88/255, opacity: 0.68).opacity(0.8) : baseOverlayColor(height: 345))
                CustomCircle(width: 243, height: 243, overlayColor: clicked ? Color(red: 5/255, green: 30/255, blue: 88/255, opacity: 0.68).opacity(0.6) : baseOverlayColor(height: 243))
                Ellipse()
                    .fill(Color(red: 63/255, green: 49/255, blue: 120/255))
                    .shadow(color: Color.black.opacity(0.70), radius: 50, x: 0, y: 10)
                    .frame(width: 180, height: 180)
                    .onTapGesture {
                        withAnimation {
                            self.clicked.toggle()
                        }
                        locationManager.requestLocation()
                    }
                
                
                VStack{
                    Text("Tap to find")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                    Text("People near you")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                }
            }
            Spacer()
            HStack{
                Image("Home")
                    .onTapGesture{
                        gotoHome = true
                    }
                Spacer()
                Image("user")
            }
            .padding(15)
        }
        .navigationDestination(isPresented: $gotoHome) {
            TargetView()
        }
        .onChange(of: locationManager.lastLocation) { newLocation in
            guard let location = newLocation else { return }
            ScanService.shared.findNearbyUsers(location: location) { result in
                switch result {
                case .success(let users):
                    self.nearbyUsers = users
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}


struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
//

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var lastLocation: CLLocation?

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
    }

    func requestLocation() {
        locationManager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastLocation = locations.first
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

struct ScanModel: Codable {
    let id: String
    let name: String
    let distance: Double
}

class ScanService {
    static let shared = ScanService()
    let baseURL = "http://192.168.105.94:5000/api/users/nearby-users" // Replace with your actual server URL

    func findNearbyUsers(location: CLLocation, completion: @escaping (Result<[ScanModel], Error>) -> Void) {
        let url = URL(string: "\(baseURL)/nearby-users")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "location": [
                "lat": location.coordinate.latitude,
                "lon": location.coordinate.longitude
            ]
        ]
        print("#$#$#$", body)
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch {
            completion(.failure(error))
            return
        }

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            do {
                // Assuming your server returns JSON with an array of user data
                let users = try JSONDecoder().decode([ScanModel].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
