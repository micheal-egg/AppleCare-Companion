//
//  Device.swift
//  AppleCareCompanion
//
//  Created by Micheal Egboh  on 11/2/25.
//

import Foundation

//Device Model
//Struct will be used to represent the apple device
//JSON from backend matches it

struct Device: Identifiable, Codable, Hashable {
    // 'id is key identifier
    // immutable variable
    let id: String
    // User-facing info
    let name: String           // e.g. "iPhone 15 Pro"
    let serialNumber: String
    let purchaseDate: String
    let coverageEndDate: String
    let coverageStatus: String // "Active" or "Expired"
}

//Response gotten from GET requests <id>/warranty
//Displaying warranty info 
struct Warranty: Codable, Hashable {
    let deviceID: String
    let coverageStatus: String
    let coverageEndDate: String
    let daysRemaining: Int
}
