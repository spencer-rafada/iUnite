//
//  EventDetailView.swift
//  iUnite
//
//  Created by Spencer Rafada on 11/7/22.
//

import SwiftUI
import MapKit

struct EventDetailView: View {
    
    @EnvironmentObject private var vm: EventsViewModel
    let event: Event
    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y:0)
                VStack (alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton, alignment: .topLeading)
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: EventsDataService.events.first!)
            .environmentObject(EventsViewModel())
    }
}

extension EventDetailView {
    
    private var imageSection: some View {
        TabView {
            ForEach (event.imageNames, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View {
        VStack (alignment: .leading, spacing: 8) {
            Text(event.eventName)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(event.hostUser)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    
    private var descriptionSection: some View {
        VStack (alignment: .leading, spacing: 8) {
            Text(event.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            // Can be a Link()
        }
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: event.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [event]) { event in
            MapAnnotation(coordinate: event.coordinates) {
                EventMapAnnotationView()
                    .shadow(radius: 10)
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(30)
//        Map(coordinateRegion: $vm.eventRegion,
//            annotationItems: vm.events,
//            annotationContent: { event in
//            MapAnnotation(coordinate: event.coordinates) {
//                EventMapAnnotationView()
//                    .scaleEffect(vm.eventLocation == event ? 1 : 0.6)
//                    .shadow(radius: 10)
//                    .onTapGesture {
//                        vm.showNextEvent(event: event)
//                    }
//            }
//        })
    }
    
    private var backButton: some View {
        Button {
            vm.sheetEvent = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
}
