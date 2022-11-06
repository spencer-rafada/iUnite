//
//  EventsListView.swift
//  iUnite
//
//  Created by Spencer Rafada on 11/3/22.
//

import SwiftUI

struct EventsListView: View {
    @EnvironmentObject private var vm: EventsViewModel
    var body: some View {
        List {
            ForEach(vm.events) { event in
                Button {
                    vm.showNextEvent(event: event)
                } label: {
                    listRowView(event: event)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
    }
}

struct EventsListView_Previews: PreviewProvider {
    static var previews: some View {
        EventsListView()
            .environmentObject(EventsViewModel())
    }
}

extension EventsListView {
    private func listRowView (event: Event) -> some View {
        HStack {
            VStack (alignment: .leading) {
                Text(event.eventName)
                    .font(.headline)
                Text(event.buildingName + " - " + event.hostUser)
                    .font(.subheadline)
            }
        }
    }
}
