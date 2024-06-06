//
//  JobView.swift
//  InterviewChecker
//
//  Created by Mark Golubev on 28/05/2024.
//

import SwiftUI

struct JobView: View {
    @Bindable var job: Job
    @State var editingMode = false
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    let isNewJob: Bool

    var body: some View {
            ZStack {
                Color(uiColor: UIColor.systemGray6)
                ScrollView {
                    if !editingMode {
                        VStack {
                            VStack {
                                Text(job.company)
                                    .font(.title2)
                                Text(job.position)
                                    .font(.title3)
                                Text(job.range)
                                    .font(.footnote)
                            }
                            .padding()
                            
                            VStack {
                                Link("link", destination: URL(string: job.link) ?? URL(string: "https://apple.com")!)
                                    .padding(.vertical,5)
                                Text(job.aboutPosition)
                                    .padding(.vertical,5)
                                Text(job.notes)
                                    .padding(.vertical,5)
                                
                            }
                            .padding(.horizontal)
                        }
                    } else {
                        VStack {
                            VStack(alignment: .center) {
                                MultilineTextField(text: $job.company, title: nil)
                                    .multilineTextAlignment(.center)
                                    .font(.title2)
                                MultilineTextField(text: $job.position, title: nil)
                                    .multilineTextAlignment(.center)
                                    .font(.title3)
                                MultilineTextField(text: $job.range, title: nil)
                                    .multilineTextAlignment(.center)
                                    .font(.footnote)
                            }
                            .padding()
                            
                            VStack {
                                MultilineTextField(text: $job.link, title: nil)
                                    .padding(.vertical,5)
                                MultilineTextField(text: $job.aboutPosition, title: "About position")
                                    .padding(.vertical,5)
                                MultilineTextField(text: $job.notes, title: "My notes")
                                    .padding(.vertical,5)
                                
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .toolbar {
                if !isNewJob {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            editingMode.toggle()
                        }) {
                            Text(editingMode ? "View" : "Edit")
                        }
                    }
                } else {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            modelContext.insert(job)
                            dismiss()
                        }) {
                            Text("Save")
                        }
                    }
                }
            }
    }
}

#Preview {
    JobView(job: Job(timestamp: Date(), company: "Apple", position: "Senior Software Developer Engineer", link: "http://apple.com", aboutPosition: "Short text about position Short text about position Short text about position Short text about position Short text about position Short text about position Short text about position Short text about position Short text about position", range: "100k - 120k", notes: "notes here notes here notes here notes here notes here notes here notes here notes here"), isNewJob: false)
        .modelContainer(for: Job.self, inMemory: true)
}
