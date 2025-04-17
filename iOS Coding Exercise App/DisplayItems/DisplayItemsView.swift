//
//  ContentView.swift
//  iOS Coding Exercise App
//
//  Created by Jason Maderski on 4/15/25.
//

import SwiftUI

struct DisplayItemsView: View {
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
    DisplayItemsView()
}
