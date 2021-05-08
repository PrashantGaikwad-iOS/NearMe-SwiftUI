//
//  MKCoordinateRegion_Extension.swift
//  NearMe
//
//  Created by Prashant Gaikwad on 08/05/21.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
    static var defaultRegion: MKCoordinateRegion {
        return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 18.5204, longitude: 73.8567), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }
}
