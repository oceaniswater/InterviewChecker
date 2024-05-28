//
//  InboxView.swift
//  InterviewChecker
//
//  Created by Mark Golubev on 28/05/2024.
//

import SwiftUI

struct InboxView: View {
    typealias Destination = InboxDestination
    
    @Environment(\.inboxRouter) private var router
    
    // MARK: - Views
    var body: some View {
        VStack {
            Button {
                router.navigate(to: .chat)
            } label: {
                VStack {
                    Image(systemName: "tray")
                        .font(.largeTitle)
                    
                    Text("Go to chat")
                        .font(.body)
                }
                .foregroundStyle(Color.primary)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.gray)
        .routerDestination(router: router,
                           destination: navigationDestination)
    }
    
    @ViewBuilder private func navigationDestination(_ destination: Destination) -> some View {
        switch destination {
        case .chat:
            ChatView()
        }
    }
}

#Preview {
    InboxView()
}
