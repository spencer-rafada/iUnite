//
//  LocationPreviewView.swift
//  iUnite
//
//  Created by Spencer Rafada on 11/4/22.
//

import SwiftUI

struct EventPreviewView: View {
    @EnvironmentObject private var vm: EventsViewModel
    let event: Event
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack (alignment: .leading, spacing: 16){
                imageSection
                title
            }
            
            VStack (spacing: 8){
                details
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .offset(y: 70)
        )
        .cornerRadius(10)
    }
}

struct EventPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            
            EventPreviewView(event: EventsDataService.events.first!)
                .padding()
        }
        .environmentObject(EventsViewModel())
    }
}

extension EventPreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = event.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(7)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var title: some View {
        VStack (alignment: .leading, spacing: 4) {
            Text(event.eventName)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(event.hostUser)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var details: some View {
        Button {
            
        } label: {
            Text("Details")
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .buttonStyle(.borderedProminent)
    }
    private var nextButton: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .buttonStyle(.bordered)
    }
}
