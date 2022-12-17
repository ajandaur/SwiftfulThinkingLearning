//
//  LocationsViewModel.swift
//  Map_App
//
//  Created by Anmol  Jandaur on 3/8/22.
//

import Foundation
import MapKit
import SwiftUI


class LocationViewModel: ObservableObject {
    
    
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // show list of locations
    @Published var showLocationsList: Bool = false
    
    // Show location detail via sheet
    @Published var sheetLocation: Location? = nil 
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
    }
    
     func toggleLocationList() {
         withAnimation(.easeInOut) {
             showLocationsList.toggle()
         }
    }
    
    func showNextLocation(location: Location) {
        mapLocation = location
        showLocationsList = false 
    }
    
    func nextButtonPressed() {
        // Get the next index
        
//        let currentIndex = locations.firstIndex { location in
//            return location == mapLocation
//        }
        
        guard let currentIndex =  locations.firstIndex(where: { $0 == mapLocation }) else {
            print("Could not find current index in locations array! Should never happen.")
            return
        }
        
        // Check if the current index is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // next index is not valid
            // restart from 0
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        // next index is VALID
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
    
}



