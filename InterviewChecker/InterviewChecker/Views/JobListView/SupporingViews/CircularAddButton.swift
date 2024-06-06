//
//  CircularAddButton.swift
//  InterviewChecker
//
//  Created by Mark Golubev on 06/06/2024.
//

import SwiftUI

import SwiftUI

struct CircularAddButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
                .padding(20)
                .background(Color.blue)
                .clipShape(Circle())
                .shadow(radius: 10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

//struct CircularAddButton_Previews: PreviewProvider {
//    static var previews: some View {
//        CircularAddButton(action: {
//            print("Add button tapped")
//        })
//        .previewLayout(.sizeThatFits)
//        .padding()
//    }
//}


#Preview {
    CircularAddButton {
        
    }
    .previewLayout(.sizeThatFits)
    .padding()
}
