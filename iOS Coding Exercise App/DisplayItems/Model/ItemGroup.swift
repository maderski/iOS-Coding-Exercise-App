//
//  ItemGroup.swift
//  iOS Coding Exercise App
//
//  Created by Jason Maderski on 4/15/25.
//
import shared

struct ItemGroup: Identifiable {
    let listId: Int
    let items: [Item]

    var id: Int { listId } // Needed for ForEach/List in SwiftUI
}
