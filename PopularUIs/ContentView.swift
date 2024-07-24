//
//  ContentView.swift
//  PopularUIs
//
//  Created by admin on 24/07/2024.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @State private var users: [User] = []
    @State private var products: [Product] = []
    
    var body: some View {
        ScrollView{
            VStack {
//                ForEach(users) { user in
//                    Text(user.firstName)
//                }
                ForEach(products) { product in
                    Text(product.title)
                        .foregroundStyle(.spotifyGreen)
                }
            }
        }
        .padding()
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        } catch {
            print("Error fetching data: \(error)")
        }
    }
}

#Preview {
    ContentView()
}
