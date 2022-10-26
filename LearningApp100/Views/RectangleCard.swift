//
//  Rectangle Card.swift
//  LearningApp100
//
//  Created by Harrison Carroll on 26/10/2022.
//

import SwiftUI

struct RectangleCard: View {
    var color = Color.white
    
    var body: some View {
        Rectangle()
            .foregroundColor(color).cornerRadius(10).shadow(radius: 5)
    
    }
}

struct RectangleCard_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCard()
    }
}
