//
//  BumbleChatsView.swift
//  SwiftfulSwiftUIinPractice
//
//  Created by Anmol  Jandaur on 3/20/25.
//

import SwiftUI

struct BumbleChatsView: View {
    @Environment(\.router) var router
    
    @State private var allUsers: [User] = []
    
    var body: some View {
        
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            VStack {
                header
                    .padding(16)
                
                matchQueueSection
                recentChatsSection
            }
        }
        .task { await getData() }
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
    
    private var recentChatsSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Group {
                    Text("Chats")
                    +
                    Text("(\(allUsers.count))")
                        .foregroundStyle(.bumbleGray)
                }
                Spacer(minLength: 0)
                Image(systemName: "line.horizontal.3.decrease")
                    .font(.title2)
            }
            .padding(.horizontal, 16)
      
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 16) {
                    ForEach(allUsers) { user in
                        BumbleChatPreviewCell(
                            imageName: user.images.randomElement()!,
                            percentageRemaining: Double.random(in: 0...1),
                            hasNewMessage: Bool.random(),
                            userName: user.firstName,
                            lastChatMessage: user.aboutMe,
                            isYourMove: Bool.random()
                            )
                    }
                }
                .padding(16)
            }
            .scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var matchQueueSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                Text("Match Queue")
                +
                Text("(\(allUsers.count))")
                    .foregroundStyle(.bumbleGray)
            }
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(allUsers) { user in
                        BumbleProfileImageCell(
                            imageName: user.image,
                            percentageRemaining: Double.random(
                                in: 0...1
                            ),
                            hasNewMessage: Bool.random()
                        )
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
            .frame(height: 100)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Image(systemName: "line.horizontal.3")
                .onTapGesture {
                    router.dismissScreen()
                }
            Spacer(minLength: 0)
            Image(systemName: "magnifyingglass")
                
        }
        .font(.title)
        .fontWeight(.medium)
    }
    
    private func getData() async {
        guard allUsers.isEmpty else { return }
        
        do {
            allUsers = try await DatabaseHelper().getUsers()
        } catch {
            
        }
    }
}

#Preview {
    BumbleChatsView()
}
