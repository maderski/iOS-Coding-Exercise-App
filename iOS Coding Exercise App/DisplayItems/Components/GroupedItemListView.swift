//
//  GroupedItemListView.swift
//  iOS Coding Exercise App
//
//  Created by Jason Maderski on 4/17/25.
//
import SwiftUI

struct GroupedItemListView: View {
  let itemGroups: [ItemGroup]

  var body: some View {
    List {
      ForEach(itemGroups, id: \.listId) { group in
        Section(header: GroupHeader(text: "List ID: \(group.listId)")) {
          ForEach(group.items, id: \.id) { item in
              VStack(alignment: .leading) {
                  Text(item.name)
                      .font(.headline)
                  Text("ID: \(item.id)")
                      .font(.subheadline)
                  HStack {
                      Spacer()
                      Text("List ID: \(item.listId)")
                          .font(.caption)
                          .foregroundColor(.gray)
                  }
              }
              .padding(.vertical, 4)
          }
        }
      }
    }
    .listStyle(.plain)  // ← makes headers sticky
    .clipped()
  }
}
