//
//  MultilineTextField.swift
//  InterviewChecker
//
//  Created by Mark Golubev on 29/05/2024.
//

import SwiftUI

struct MultilineTextField: View {
    @Binding var text: String
    @State private var textHeight: CGFloat = 40
    let title: String?
    
    var body: some View {
        VStack {
            Text(title ?? "")
                .font(.headline)
            
            ZStack(alignment: .topLeading) {
                TextEditor(text: $text)
                    .frame(minHeight: textHeight, maxHeight: .infinity)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(UIColor.separator), lineWidth: 0)
                    )
                    .onAppear {
                        recalculateHeight()
                    }
                    .onChange(of: text, perform: { _ in
                        recalculateHeight()
                    })
                
                Text(text)
                    .font(.body)
                    .padding(.all, 8)
                    .background(GeometryReader { geometry in
                        Color.clear.onAppear {
                            recalculateHeight(geometry.size.height)
                        }
                    })
                    .opacity(0) // Hidden text view to measure height
                    .padding(.horizontal, 4)
            }

            
            Spacer()
        }
//        .navigationBarItems(leading: Button("Cancel", action: {
//            // Cancel action
//        }), trailing: Button("Done", action: {
//            // Done action
//        }))
    }
    
    private func recalculateHeight(_ height: CGFloat = 0) {
        let size = CGSize(width: UIScreen.main.bounds.width - 64, height: .infinity)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: UIFont.systemFontSize)]
        let estimatedHeight = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil).height
        textHeight = max(40, height == 0 ? estimatedHeight : height)
    }
}

#Preview {
        MultilineTextField(text: .constant("Apple"), title: "My notes")
    }
