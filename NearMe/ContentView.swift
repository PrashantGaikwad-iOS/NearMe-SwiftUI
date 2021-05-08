//
//  ContentView.swift
//  NearMe
//
//  Created by Prashant Gaikwad on 08/05/21.
//

import SwiftUI
import MapKit

enum DisplayType {
    case map
    case list
}

struct ContentView: View {
    
    @StateObject var placeListModel = PlaceListViewModel()
    @State private var userTrackingMode: MapUserTrackingMode = MapUserTrackingMode.follow
    @State private var searchTerm: String = ""
    @State private var displayType: DisplayType = .map
    @State private var isDragged: Bool = false
    
    private func getRegion() -> Binding<MKCoordinateRegion> {
        guard let location = placeListModel.currentLocation else {
            return .constant(MKCoordinateRegion.defaultRegion)
        }
        
        return .constant(MKCoordinateRegion(center: location,span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
    }
    
    var body: some View {
        VStack {
            TextField("Search", text: $searchTerm, onEditingChanged: { _ in
                
            }, onCommit: {
                placeListModel.searchLandmarks(searchTerm: searchTerm)
            }).textFieldStyle(RoundedBorderTextFieldStyle())
            
            LandmarkCategoryView { selectedCategory in
                placeListModel.searchLandmarks(searchTerm: selectedCategory)
            }
            
            Picker("Selection", selection: $displayType) {
                Text("Map").tag(DisplayType.map)
                Text("List").tag(DisplayType.list)
            }.pickerStyle(SegmentedPickerStyle())
            
            if displayType == .map {
                Map(coordinateRegion: getRegion(), interactionModes: .all, showsUserLocation: true, userTrackingMode: $userTrackingMode,annotationItems:placeListModel.landmarks) { landmark in
                    MapMarker(coordinate: landmark.coordinate)
                }
                .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            isDragged = true
                        })
                ).overlay(isDragged ? AnyView(RecenterButton{
                    placeListModel.startUpdatingLocation()
                    isDragged = false
                }) : AnyView(EmptyView()),alignment: .bottom)
                
            } else {
                LandmarkListView(landmarks: placeListModel.landmarks)
            }
            
            
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
