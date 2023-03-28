//
//  ViewModel.swift
//  Amiibopedia
//
//  Created by Iván Sánchez Torres on 08/03/23.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published var amiibos: [Amiibo] = []
    
    /// Logic of every query
    func getAllAmiibos() async {
        guard let url = URL(string: "https://www.amiiboapi.com/api/amiibo/") else { return }
        
        let (data, _) = try! await URLSession.shared.data(from: url)
        /// Extracting the data to map it into AmiiboResponse model
        let amiiboModel = try! JSONDecoder().decode(AmiiboResponse.self, from: data)
        
        DispatchQueue.main.async {
            /// everytime a query be done, amiibos property will be updated and the property will "redraw" the view
            self.amiibos = amiiboModel.amiibos
        }
    }
    
    ///
    func getAmiibo(character: String) async {
        guard let url = URL(string: "https://www.amiiboapi.com/api/amiibo/?character=\(character)") else { return }
        let (data, _) = try! await URLSession.shared.data(from: url)
        
        let amiiboModel = try! JSONDecoder().decode(AmiiboResponse.self, from: data)
        
        DispatchQueue.main.async {
            self.amiibos = amiiboModel.amiibos
        }
    }
}
