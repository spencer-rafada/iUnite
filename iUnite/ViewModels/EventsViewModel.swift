//
//  EventsViewModel.swift
//  iUnite
//
//  Created by Spencer Rafada on 11/3/22.
//

import Foundation
import SwiftUI
import MapKit

class EventsViewModel: ObservableObject {
    // All information
    @Published var events: [Event]
    
    // Current location on the map
    @Published var eventLocation: Event {
        didSet {
            updateEventRegion(event: eventLocation)
        }
    }
    
    // Current region on map
    @Published var eventRegion: MKCoordinateRegion = MKCoordinateRegion()
    let eventSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    
    // Show list of locations
    @Published var showEventsList: Bool = false
    
    init() {
        let events = EventsDataService.events
        self.events = events
        self.eventLocation = events.first!
        self.updateEventRegion(event: events.first!)
    }
    
    private func updateEventRegion(event: Event) {
        withAnimation(.easeInOut) {
            eventRegion = MKCoordinateRegion(center: event.coordinates,
                                             span: eventSpan)
        }
    }
    
    func toggleEventsList() {
        withAnimation(.easeInOut) {
            showEventsList = !showEventsList
        }
    }
    
    func showNextEvent(event: Event) {
        withAnimation(.easeInOut) {
            eventLocation = event
            showEventsList = false
        }
    }
}
