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
            Map(coordinateRegion: $vm.eventRegion)
                .ignoresSafeArea()
            VStack (spacing: 0) {
                header
                    .padding()
                Spacer()
            }
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
}
