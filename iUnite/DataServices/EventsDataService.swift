//
//  EventsDataService.swift
//  iUnite
//
//  Created by Spencer Rafada on 11/3/22.
//
/*struct Event: Identifiable {
    let eventName: String
    let buildingName: String
    let coordinates: CLLocationCoordinate2D
    let imageNames: [String]
    let description: String
    let hostUser: String
    let members: String
    
    var id: String {
        buildingName + hostUser + eventName
    }
}*/



import Foundation
import MapKit

class EventsDataService {
    static let events: [Event] = [
        Event(eventName: "Basketball with Friends",
              buildingName: "I-Center",
              coordinates: CLLocationCoordinate2D(latitude: 43.8183, longitude: -111.7849),
              imageNames: ["i-center-1"],
              description: "Need some friends for pickup later!",
              hostUser: "Michael R",
              members: ["Mhel", "Spencer", "Jarom"]),
        Event(eventName: "Study sesh",
              buildingName: "McKay Library",
              coordinates: CLLocationCoordinate2D(latitude: 43.8193, longitude: -111.7832),
              imageNames: ["mckay-1"],
              description: "I'm going to the library to do some homework.",
              hostUser: "Rick",
              members: ["Rem", "Ed", "Um"]),
        Event(eventName: "Walmart",
              buildingName: "Walmart",
              coordinates: CLLocationCoordinate2D(latitude: 43.8536, longitude: -111.7760),
              imageNames: ["walmart-1"],
              description: "Going to pick up some groceries. Who needs a ride?",
              hostUser: "Morty",
              members: []),
        Event(eventName: "Go to the Temple",
              buildingName: "Rexburg Idaho Temple",
              coordinates: CLLocationCoordinate2D(latitude: 43.8131, longitude: -111.7835),
              imageNames: ["temple-1"],
              description: "Who wants to come with me to go to the temple?",
              hostUser: "K", members: ["KZ", "M"]),
    ]
}
