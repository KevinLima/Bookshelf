//
//  ProgressRow.swift
//  Bookshelf
//
//  Created by Kevin Lima on 13/12/2022.
//

import SwiftUI

struct PagesProgressRow: View {
    @State var value: Int
    @State var total: Int
    @State var displayName: String
    @State var metricName: String 
    
    var body: some View {
        VStack (alignment: .leading){
            Text(displayName)
                .font(.caption)
            HStack (alignment: .bottom) {
                Text("\(value)/\(total)")
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

struct ProgressRow_Previews: PreviewProvider {
    static var previews: some View {
        PagesProgressRow(value: 25, total: 100, displayName: "Progress", metricName: "Pages")
        PagesProgressRow(value: 25, total: 100, displayName: "Progress", metricName: "Pages")
            .preferredColorScheme(.dark)
    }
}
