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
    func getAmiibos() {
        let url = URL(string: "https://www.amiiboapi.com/api/amiibo/")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            /// Verifying if there is no error
            if let error = error {
                print("An error has been ocurred while getting info: \(String(describing: error))")
                return
            }
            
            if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                /// Extracting the data to map it into AmiiboResponse model
                let amiiboModel = try! JSONDecoder().decode(AmiiboResponse.self, from: data)
                
                /// everytime a query be done, amiibos property will be updated and the property will "redraw" the view
                DispatchQueue.main.async {
                    self.amiibos = amiiboModel.amiibos
                }
            }
        }.resume()
    }
}
