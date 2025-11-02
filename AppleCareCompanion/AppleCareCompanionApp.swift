//
//  AppleCareCompanionApp.swift
//  AppleCareCompanion
//
//  Created by Micheal Egboh  on 11/2/25.
//

import SwiftUI

@main
struct AppleCareCompanionApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: AppleCareCompanionDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
