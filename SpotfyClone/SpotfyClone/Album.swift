//
//  File.swift
//  SpotfyClone
//
//  Created by Student18 on 01/08/23.
//

import Foundation

struct Sugestions: Identifiable{
    var id: Int
    var albumCover: String
    var albumName: String
}


struct Song: Identifiable{
    var id: Int
    var name: String
    var artist: String
    var capa: String
}
