//
//  EventsView.swift
//  iUnite
//
//  Created by Spencer Rafada on 11/3/22.
//

import SwiftUI
import MapKit

struct EventsView: View {
    @EnvironmentObject private var vm: EventsViewModel
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()
            VStack (spacing: 0) {
                header
                    .padding()
                Spacer()
                eventsPreview
            }
        }
        .sheet(item: $vm.sheetEvent, onDismiss: nil) { event in
            EventDetailView(event: event)
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
            .environmentObject(EventsViewModel())
    }
}

extension EventsView {
    private var header: some View {
        VStack{
            Button(action: vm.toggleEventsList) {
                Text(vm.eventLocation.eventName)
                    .font(.title2)
                    .fontWeight(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showEventsList ? 180 : 0))
                    }
            }
            if vm.showEventsList {
                EventsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: $vm.eventRegion,
            annotationItems: vm.events,
            annotationContent: { event in
            MapAnnotation(coordinate: event.coordinates) {
                EventMapAnnotationView()
                    .scaleEffect(vm.eventLocation == event ? 1 : 0.6)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextEvent(event: event)
                    }
            }
        })
    }
    
    private var eventsPreview: some View {
        ZStack {
            ForEach(vm.events) { event in
                if vm.eventLocation == event {
                    EventPreviewView(event: event)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)))
                }
            }
        }
    }
}
