//
//  NetflixDetailsHeaderView .swift
//  PopularUIs
//
//  Created by Mateusz Krówczyński on 07/08/2024.
//

import SwiftUI
import SwiftfulUI

struct NetflixDetailsHeaderView_: View {
    
    var imageName: String = Constants.randomImage
    var progress: Double = 0.2
    var onAirplayPressed: (() -> Void)? = nil
    var onXmarkPressed: (() -> Void)? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: imageName)
                .overlay(alignment: .topTrailing) {
                    HStack(spacing: 0) {
                        Button(action: {
                            onAirplayPressed?()
                        }, label: {
                            Circle()
                                .frame(width: 40, height: 40)
                                .overlay {
                                    Image(systemName: "tv.badge.wifi")
                                        .foregroundStyle(.netflixWhite)
                                        .fontWeight(.semibold)
                                }
                                .foregroundStyle(.netflixDarkGray)
                        })
                        .padding(8)
                        
                        Button(action: {
                            onXmarkPressed?()
                        }, label: {
                            Circle()
                                .frame(width: 40, height: 40)
                                .overlay {
                                    Image(systemName: "xmark")
                                        .foregroundStyle(.netflixWhite)
                                        .fontWeight(.semibold)
                                }
                                .foregroundStyle(.netflixDarkGray)
                        })
                    }
                    .padding(.trailing, 8)
                }
            
            CustomProgressBar(
                selection: progress,
                range: 0...1,
                backgroundColor: Color.netflixLightGray,
                foregroundColor: Color.netflixRed,
                cornerRadius: 2,
                height: 4
            )
            .padding(.bottom, 4)
            .animation(.linear, value: progress)
            
        }
        .frame(width: UIScreen.main.bounds.width, height: 200)
    }
}

#Preview {
    NetflixDetailsHeaderView_()
}
