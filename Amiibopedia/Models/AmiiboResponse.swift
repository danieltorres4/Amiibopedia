//
//  AmiiboResponse.swift
//  Amiibopedia
//
//  Created by Iván Sánchez Torres on 08/03/23.
//

import Foundation

struct AmiiboResponse: Decodable {
    let amiibos: [Amiibo]
    
    enum CodingKeys: String, CodingKey {
        case amiibo
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amiibos = try container.decode([Amiibo].self, forKey: .amiibo)
    }
}
