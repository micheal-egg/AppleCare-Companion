//
//  APIClient.swift
//  AppleCareCompanion
//
//  Created by Micheal Egboh  on 11/2/25.
//

import Foundation
import Combine


// The class is responsible for talking to the Flask backend.
// Fetching list og Devices and warranty for a device

@MainActor
class APIClient: ObservableObject {
    
    // This is the array of devices we got from the backend.
    // @Published means: if this changes, any SwiftUI view using this object will update on screen automatically.
    
    @Published var devices: [Device] = []
    
    // This is where Flask API is running.
    // Only can be used by this Class
    private let baseURL = "http://127.0.0.1:5000"

    //Allowing for asynchronous function
    //Gets called with "await"
    func fetchDevices() async {
        
        // Converting String to URL object, used by "Url Session"
        // Building the URL: http://127.0.0.1:5000/devices
        //Guard, if the link is broken return error message 
        guard let url = URL(string: "\(baseURL)/devices") else {
            print("Invalid URL for /devices")
            return
        }
        
        do {
            // Send a GET request and wait for response.
            // URLSession.shared.data(from:) returns (data, response).
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Decoding Flask's JSON into Swift structs.
            // Device must match the JSON style from  Flask /devices route.
            let decoded = try JSONDecoder().decode([Device].self, from: data)
            
            // Store the decoded devices. This triggers UI updates.
            self.devices = decoded
            
        } catch {
            // If something goes wrong (Flask not running, bad JSON, etc.)
            print("Error fetching devices:", error)
        }
    }
    
}
