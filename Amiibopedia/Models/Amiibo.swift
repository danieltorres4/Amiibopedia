//
//  Amiibo.swift
//  Amiibopedia
//
//  Created by Iván Sánchez Torres on 08/03/23.
//

import Foundation

struct Amiibo: Decodable {
    let amiiboSeries: String
    let character: String
    let gameSeries: String
    let image: String
    let name: String
    let tail: String
    let type: String
}
