//
//  LandmarkViewModel.swift
//  NearMe
//
//  Created by Prashant Gaikwad on 08/05/21.
//

import Foundation
import MapKit

struct LandmarkViewModel: Identifiable {
    let placemark: MKPlacemark
    
    let id = UUID()
    
    var name: String {
        return placemark.name ?? ""
    }
    
    var title: String {
        return placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        return placemark.coordinate
    }
}
