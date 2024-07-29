//
//  BumbleHomeView.swift
//  PopularUIs
//
//  Created by admin on 28/07/2024.
//

import SwiftUI
import SwiftfulUI

struct BumbleHomeView: View {
    
    @State private var options: [String] = ["Everyone", "Trending"]
    @AppStorage("buble_home_filter") private var selection: String = "Everyone"
    @State private var allUsers: [User] = []
    @State private var selectedIndex: Int = 0
    @State private var cardOffsets: [Int: Bool] = [:] // UserID : (Direction is right == true)
    @State private var currentSwipeOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 12) {
                header
                
                BumbleFilterView(options: options, selection: $selection)
                    .background(
                        Divider(), alignment: .bottom
                    )
                
                ZStack {
                    if !allUsers.isEmpty {
                        ForEach(Array(allUsers.enumerated()), id: \.offset) { (index, user) in
                            
                            let isPrevious = (selectedIndex - 1) == index
                            let isCurrent = selectedIndex == index
                            let isNext = (selectedIndex + 1) == index
                            
                            if isPrevious || isCurrent || isNext {
                                let offsetValue = cardOffsets[user.id]
                                
                                userProfileCell(user: user, index: index)
                                    .zIndex(Double(allUsers.count - index))
                                    .offset(x: offsetValue == nil ? 0 : offsetValue == true ? 900 : -900)
                            }
                        }
                    } else {
                        ProgressView()
                    }
                    
                    overlaySwipingIndicators
                    .zIndex(99999999999999)
                    .animation(.smooth, value: currentSwipeOffset)
                }
                .frame(maxHeight: .infinity)
                .padding(4)
                .animation(.smooth, value: cardOffsets)
            }
            .padding(8)
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func userDidSelect(index: Int, isLike: Bool) {
        let user = allUsers[index]
        cardOffsets[user.id] = isLike
        
        selectedIndex += 1
    }
    
    private func getData() async {
        guard allUsers.isEmpty else { return }
        
        do {
            allUsers = try await DatabaseHelper().getUsers()
            }
            
         catch {
            print("Error fetching data: \(error)")
        }
    }
    
    private var overlaySwipingIndicators: some View {
        ZStack {
            Circle()
                .fill(.bumbleGray.opacity(0.4))
                .overlay {
                    Image(systemName: "xmark")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .frame(width: 60, height: 60)
                .scaleEffect(abs(currentSwipeOffset) > 100 ? 1.5 : 1.0)
                .offset(x: min(-currentSwipeOffset, 150))
                .offset(x: -100)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Circle()
                .fill(.bumbleGray.opacity(0.4))
                .overlay {
                    Image(systemName: "checkmark")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .frame(width: 60, height: 60)
                .scaleEffect(abs(currentSwipeOffset) > 100 ? 1.5 : 1.0)
                .offset(x: max(-currentSwipeOffset, -150))
                .offset(x: 100)
                .frame(maxWidth: .infinity, alignment: .trailing)
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
    
    private func userProfileCell(user: User, index: Int) -> some View {
        BumbleCardView(
            user: user,
            onSuperLikePressed: nil,
            onXmarkPressed: nil,
            onCheckmarkPressed: {
                userDidSelect(index: index, isLike: false)
            },
            onSendAComplimentPressed: {
                userDidSelect(index: index, isLike: true)
            },
            onHideAndReportPressed: {
                
            }
        )
            .withDragGesture(
                .horizontal,
                minimumDistance: 50,
                rotationMultiplier: 1.05,
                onChanged: { CGSize in
                    currentSwipeOffset = CGSize.width
                },
                onEnded: { CGSize in
                    if CGSize.width < -50 {
                        userDidSelect(index: index, isLike: false)
                    } else if CGSize.width > 50 {
                        userDidSelect(index: index, isLike: true)
                    }
                }
            )
    }
}

#Preview {
    BumbleHomeView()
}
