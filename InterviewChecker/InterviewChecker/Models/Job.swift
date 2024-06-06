//
//  Job.swift
//  InterviewChecker
//
//  Created by Mark Golubev on 28/05/2024.
//

import Foundation
import SwiftData

@Model
final class Job: Codable {
    var id: UUID = UUID()
    var timestamp: Date
    var company: String
    var position: String
    var link: String
    var aboutPosition: String
    var range: String
    var notes: String
    @Relationship(deleteRule: .cascade) var stages: [Stage] = [Stage]()
    
    init(timestamp: Date, company: String, position: String, link: String, aboutPosition: String, range: String = "n/a", notes: String) {
        self.timestamp = timestamp
        self.company = company
        self.position = position
        self.link = link
        self.aboutPosition = aboutPosition
        self.range = range
        self.notes = notes
    }
    
    // MARK: Codable conformance
    enum CodingKeys: String, CodingKey {
        case id, timestamp, company, position, link, aboutPosition, range, notes, stages
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        timestamp = try container.decode(Date.self, forKey: .timestamp)
        company = try container.decode(String.self, forKey: .company)
        position = try container.decode(String.self, forKey: .position)
        link = try container.decode(String.self, forKey: .link)
        aboutPosition = try container.decode(String.self, forKey: .aboutPosition)
        range = try container.decode(String.self, forKey: .range)
        notes = try container.decode(String.self, forKey: .notes)
        stages = try container.decode([Stage].self, forKey: .stages)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(timestamp, forKey: .timestamp)
        try container.encode(company, forKey: .company)
        try container.encode(position, forKey: .position)
        try container.encode(link, forKey: .link)
        try container.encode(aboutPosition, forKey: .aboutPosition)
        try container.encode(range, forKey: .range)
        try container.encode(notes, forKey: .notes)
        try container.encode(stages, forKey: .stages)
    }
}

@Model
final class Stage: Codable {
    var job: Job?
    var name: String
    var color: String
    
    init(job: Job? = nil, name: String, color: String) {
        self.job = job
        self.name = name
        self.color = color
    }
    
    // MARK: Codable conformance
    enum CodingKeys: String, CodingKey {
        case job, name, color
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        job = try container.decode(Job?.self, forKey: .job)
        name = try container.decode(String.self, forKey: .name)
        color = try container.decode(String.self, forKey: .color)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(job, forKey: .job)
        try container.encode(name, forKey: .name)
        try container.encode(color, forKey: .color)
    }
}

