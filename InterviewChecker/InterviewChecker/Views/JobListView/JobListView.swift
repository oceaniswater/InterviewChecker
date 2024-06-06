//
//  ContentView.swift
//  InterviewChecker
//
//  Created by Mark Golubev on 28/05/2024.
//

import SwiftUI
import SwiftData

struct JobListView: View {
    typealias Destination = JobListRouter.Destination
    
    enum NavigationItem: String, CaseIterable {
        case subview = "JobList subview"
        case inbox
        
    }
    
    private let navigationTitle = TabBarView.Tab.jobs.title
    @Environment(JobListRouter.self) private var router
    @Environment(\.modelContext) private var modelContext
    @Query(sort: [SortDescriptor(\Job.timestamp, order: .reverse)]) private var jobs: [Job]
    
    var body: some View {
        @Bindable var router = router
        
        NavigationStack(path: $router.path) {
            
            HStack {
                Text("Jobs count: \(jobs.count)")
                    .font(.title)
                Spacer()
            }
            .padding()
            
            listView
                .routerDestination(router: router,
                                   navigationBackTitle: navigationTitle,
                                   destination: navigationDestination)
            
                .overlay(alignment: .bottomTrailing) {
                    CircularAddButton(action: {
                        addItem()
                    })
                    .offset(x: -50, y: -30)
                }
            
            
        }
        
    }
    
    @ViewBuilder private func navigationDestination(_ destination: Destination) -> some View {
        switch destination {
        case .jobView(let type, let mode, let isNewJob):
            JobView(job: type, editingMode: mode, isNewJob: isNewJob)
        }
    }
    
    private var listView: some View {
        ScrollView {
            ForEach(jobs) { job in
                JobCellView(job: job)
                    .onTapGesture {
                        router.navigate(to: .jobView(job: job, mode: false, isNewJob: false))
                    }
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            let newJob = Job(timestamp: Date(), company: "", position: "", link: "", aboutPosition: "", range: "", notes: "")
            router.navigate(to: .jobView(job: newJob, mode: true, isNewJob: true))
//            modelContext.insert(newJob)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(jobs[index])
            }
        }
    }
}

#Preview {
    JobListView()
        .modelContainer(for: Job.self, inMemory: true)
        .environment(JobListRouter())
}
