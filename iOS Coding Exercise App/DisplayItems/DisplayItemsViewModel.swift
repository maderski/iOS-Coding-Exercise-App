//
//  AppViewModel.swift
//  iOS Coding Exercise App
//
//  Created by Jason Maderski on 4/15/25.
//
import SwiftUI
import shared
import KMPNativeCoroutinesAsync

extension DisplayItemsView {
    @Observable
    class ViewModel {
        private(set) var isLoading = false
        private(set) var itemGroups: [ItemGroup] = []
        
        private let itemRepository = KoinHelper.shared.getItemRepositoryWrapper()
        
        func fetchData() async {
            isLoading = true
            Task { @MainActor in
                let result = await asyncResult(for: itemRepository.getAllItems())
                
                switch result {
                case .success(let data):
                    itemGroups = data.map { (key, value) in
                        ItemGroup(listId: key.intValue, items: value)
                    }.sorted { $0.listId < $1.listId }
                    
                case .failure(let error):
                    print("Failed to fetch items: \(error)")
                    itemGroups = []
                }
                
                isLoading = false
            }
        }
    }
}
