//
//  ContentView.swift
//  iOS Coding Exercise App
//
//  Created by Jason Maderski on 4/15/25.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
            NavigationView {
                ZStack {
                    Color.white

                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                            .scaleEffect(2)
                    } else {
                        GroupedItemListView(itemGroups: viewModel.itemGroups)
                    }
                }
                .onAppear {
                    Task {
                        await viewModel.fetchData()
                    }
                }
            }
        }
}

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

extension UIApplication {
    var keyWindowInConnectedScenes: UIWindow? {
      connectedScenes
        .compactMap { $0 as? UIWindowScene }
        .first { $0.activationState == .foregroundActive }?
        .windows
        .first { $0.isKeyWindow }
    }
    var topSafeAreaInset: CGFloat {
      keyWindowInConnectedScenes?.safeAreaInsets.top ?? 0
    }
}

#Preview {
    ContentView()
}
