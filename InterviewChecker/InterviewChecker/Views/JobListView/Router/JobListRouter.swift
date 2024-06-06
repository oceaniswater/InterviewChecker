//
//  JobListRouter.swift
//  InterviewChecker
//
//  Created by Mark Golubev on 04/06/2024.
//
import SwiftUI

@Observable class JobListRouter: BaseRouter {
    
    enum Destination: RouterDestination, CustomStringConvertible {
        case jobView(job: Job, mode: Bool, isNewJob: Bool)
        
        var description: String {
            switch self {
            case .jobView(let job, let mode, let isNewJob):
                return "jobView(job: \(job.company))"
            }
        }
        
        var title: String {
            switch self {
            case .jobView(let job, let mode, let isNewJob):
                return "\(job.id)"
            }
        }
    }
    
    @ObservationIgnored override var routerDestinationTypes: [any RouterDestination.Type] {
        return [Destination.self]
    }
    
    // MARK: - Public
    func navigate(to destination: Destination) {
        path.append(destination)
    }
}

