//
//  BumbleHomeView.swift
//  PopularUIs
//
//  Created by admin on 28/07/2024.
//

import SwiftUI

struct BumbleHomeView: View {
    
    @State private var options: [String] = ["Everyone", "Trending"]
    @AppStorage("buble_home_filter") private var selection: String = "Everyone"
    
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 12) {
                header
                
                BumbleFilterView(options: options, selection: $selection)
                    .background(
                        Divider(), alignment: .bottom
                    )
                
                Spacer()
            }
            .padding(8)
            
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("bumble")
                .font(.title)
                .foregroundStyle(Color.bumbleYellow)
                .frame(maxWidth: .infinity, alignment: .center)
            
            
            Image(systemName: "slider.horizontal.3")
                .padding(8)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .font(.title2)
        .fontWeight(.medium)
    }
}

#Preview {
    BumbleHomeView()
}
