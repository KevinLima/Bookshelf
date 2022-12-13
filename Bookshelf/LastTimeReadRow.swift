//
//  LastTimeReadRow.swift
//  Bookshelf
//
//  Created by Kevin Lima on 13/12/2022.
//

import SwiftUI

struct LastTimeReadRow: View {
    @State var value: String
    @State var displayName: String
    
    var body: some View {
        VStack (alignment: .leading){
            Text(displayName)
                .font(.caption)
            HStack (alignment: .bottom) {
                Text("\(value)")
                    .font(.title)
                    .fontWeight(.medium)
                .foregroundColor(.accentColor)
            }
        }
    }
}

struct LastTimeReadRow_Previews: PreviewProvider {
    static var previews: some View {
        LastTimeReadRow(value: "12 october 2022", displayName: "Last time read")
    }
}
