//
//  MyListButton.swift
//  PopularUIs
//
//  Created by Mateusz Krówczyński on 07/08/2024.
//

import SwiftUI

struct MyListButton: View {
    
    var isMyList: Bool = false
    var onButtonPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack {
            ZStack {
                    Image(systemName: "checkmark")
                        .opacity(isMyList ? 1:0)
                        .rotationEffect(Angle(degrees: isMyList ? 0 : 180))

                    Image(systemName: "plus")
                        .opacity(isMyList ? 0:1)
                        .rotationEffect(Angle(degrees: isMyList ? -180 : 0))
            }
            .animation(.bouncy, value: isMyList)
            .font(.title)
            
            Text("My List")
                .font(.caption)
                .foregroundStyle(.netflixLightGray)
        }
        .foregroundStyle(.netflixWhite)
        .padding(8)
        .background(Color.black.opacity(0.001))
        
        .onTapGesture {
            onButtonPressed?()
        }
    }
}

fileprivate struct MyListButtonPreview: View {
    
    @State private var isMyList: Bool = false
    
    var body: some View {
        MyListButton(isMyList: isMyList) {
                isMyList.toggle()
        }
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        MyListButtonPreview()
    }
}
