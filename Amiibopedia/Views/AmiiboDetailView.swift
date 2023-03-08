//
//  AmiiboDetailView.swift
//  Amiibopedia
//
//  Created by Iván Sánchez Torres on 08/03/23.
//

import SwiftUI

struct AmiiboDetailView: View {
    var singleAmiibo: Amiibo
    @StateObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        VStack {
            VStack {
                AsyncImage(url: URL(string: singleAmiibo.image)) { image in
                    image
                        .resizable()
                        
                        .scaledToFit()
                } placeholder: {
                    //ProgressView()
                    Image(systemName: "gamecontroller.fill")
                        .resizable()
                        .scaledToFit()
                }

                Text("\(singleAmiibo.name)")
                    .font(.title)
                    .bold()
                    .padding()
                Text("Amiibo Series: \(singleAmiibo.amiiboSeries)")
                    .font(.body)
                Text("Game Series: \(singleAmiibo.gameSeries)")
                    .font(.body)
                Text("Type: \(singleAmiibo.type)")
                    .font(.caption)
                    .padding()
            }
        }
    }
}

struct AmiiboDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboDetailView(singleAmiibo: .init(amiiboSeries: "Amiibo Series 1", character: "Character 1", gameSeries: "Game Series 1", image: "Image 1", name: "Name 1", tail: "Tail 1", type: "Type 1"))
    }
}
