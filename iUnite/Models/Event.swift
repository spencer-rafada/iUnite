//
//  Event.swift
//  iUnite
//
//  Created by Spencer Rafada on 11/3/22.
//

import Foundation
import MapKit

struct Event: Identifiable, Equatable {
    
    
    let eventName: String
    let buildingName: String
    let coordinates: CLLocationCoordinate2D
    let imageNames: [String]
    let description: String
    let hostUser: String
    let members: [String]
    
    // Identifiable
    var id: String {
        buildingName + hostUser + eventName
    }
    
    // Equatable
    static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.id == rhs.id
    }
}
