//
//  APIClient.swift
//  AppleCareCompanion
//
//  Created by Micheal Egboh  on 11/2/25.
//

import Foundation

//Backend Communication

class APIClient: ObservableObject {
    
    // This property will hold the list of devices we fetched.
    // @Published means: if this changes, SwiftUI views watching it will update.
    @Published var devices: [Device] = []
    
    // This is the base URL of your Flask server.
    // Make sure Flask is running with `python3 app.py` so this works.
    private let baseURL = "http://127.0.0.1:5000"
    
    // Fetch all devices from GET /devices
    func fetchDevices() async {
        // Build the URL: http://127.0.0.1:5000/devices
        guard let url = URL(string: "\(baseURL)/devices") else {
            print("❌ Invalid URL for /devices")
            return
        }
    }
}
