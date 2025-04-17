//
//  GroupHeader.swift
//  iOS Coding Exercise App
//
//  Created by Jason Maderski on 4/17/25.
//
import SwiftUI

struct GroupHeader: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.headline)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color(uiColor: .systemGray5))
    }
}
