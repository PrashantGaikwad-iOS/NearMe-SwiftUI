//
//  LandmarkCategoryView.swift
//  NearMe
//
//  Created by Prashant Gaikwad on 08/05/21.
//

import SwiftUI

struct LandmarkCategoryView: View {
    
    let categories = ["Burger","Takeout","Coffee","Hotels","Fries","Pizza","Tea"]
    @State private var selectedCategory: String = ""
    let onSelectedCategory: (String) -> ()
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(categories,id:\.self) { category in
                    Button(action: {
                        selectedCategory = category
                        onSelectedCategory(category)
                    }, label: {
                        Text(category)
                    })
                    .padding()
                    .foregroundColor(selectedCategory == category ? .white : .black)
                    .background(selectedCategory == category ? Color.gray : Color.white)
                    
                }
            }
        }
    }
}

struct LandmarkCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkCategoryView(onSelectedCategory: { _ in})
    }
}
