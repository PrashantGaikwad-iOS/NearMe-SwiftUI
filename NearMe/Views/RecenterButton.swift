//
//  RecenterButton.swift
//  NearMe
//
//  Created by Prashant Gaikwad on 08/05/21.
//

import SwiftUI

struct RecenterButton: View {
    
    let onButtonTapped: () -> ()
    
    var body: some View {
        Button(action: {
            onButtonTapped()
        }, label: {
            Label("Recenter",systemImage: "triangle")
                .padding(10)
                .foregroundColor(.white)
                .background(Color.blue)
        })
    }
}

struct RecenterButton_Previews: PreviewProvider {
    static var previews: some View {
        RecenterButton(onButtonTapped: {})
    }
}
