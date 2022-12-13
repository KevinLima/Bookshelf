//
//  PercentProgressRow.swift
//  Bookshelf
//
//  Created by Kevin Lima on 13/12/2022.
//

import SwiftUI

struct PercentProgressRow: View {
    @State var displayName: String
    @State var formattedValue: String
    @State var metricName: String
    
    var body: some View {
        VStack (alignment: .leading){
            Text(displayName)
                .font(.caption)
            HStack (alignment: .bottom) {
                Text("\(formattedValue)")
                    .font(.title)
                    .fontWeight(.medium)
                .foregroundColor(.accentColor)
                + Text(" \(metricName)")
                    .font(.title2)
                    .fontWeight(.medium)
                .foregroundColor(.accentColor)
            }
        }
    }
}

struct PercentProgressRow_Previews: PreviewProvider {
    static var previews: some View {
        PercentProgressRow(displayName: "Progress", formattedValue: "30%", metricName: "Completed")
    }
}
