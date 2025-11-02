//
//  ContentView.swift
//  AppleCareCompanion
//
//  Created by Micheal Egboh  on 11/2/25.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: AppleCareCompanionDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(AppleCareCompanionDocument()))
}
