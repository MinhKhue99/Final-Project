//
//  YoutubeView.swift
//  Chef's kitchen
//
//  Created by KhuePM on 12/06/2024.
//

import SwiftUI
import WebKit
import YouTubePlayerKit

struct YoutubeView: View {
    @Environment(\.presentationMode) var presentation
    var strYoutube: String?
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    presentation.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color.gray)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                })
                
                Spacer()
            }
            .padding(.horizontal)
            
            Spacer()
            
            YouTubePlayerView(YouTubePlayer(
                source: .url(self.strYoutube ?? ""),
                configuration: .init(
                    autoPlay: true,
                    showControls: true,
                    showFullscreenButton: true
                    
                )
            ))
            .frame(width: UIScreen.main.bounds.width, height: 300)
            .padding(.vertical)
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    YoutubeView()
}
