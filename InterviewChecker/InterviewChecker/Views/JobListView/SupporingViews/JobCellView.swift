//
//  JobCellView.swift
//  InterviewChecker
//
//  Created by Mark Golubev on 28/05/2024.
//

import SwiftUI

struct JobCellView: View {
    var job: Job
    
    var body: some View {
        VStack(alignment:.trailing) {
            HStack(spacing: 20) {
                Text(job.company)
                Spacer()
                Text(job.position)

            }
            
            Text(job.range)
                .font(.footnote)
            
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.purple)
                .opacity(0.5)
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    JobCellView(job: Job(timestamp: Date(), company: "Gloabal Relay Ltd", position: "Senior Software Engineer", link: "http/apple.com", aboutPosition: "about position", range: "100k", notes: "notes"))
}
