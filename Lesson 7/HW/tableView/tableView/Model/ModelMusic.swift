//
//  model.swift
//  tableView
//
//  Created by Роман on 16.03.2022.
//

import Foundation

struct ModelMusic {
    var artist: String
    var cover: String
    var rating: Int
}

struct ModelSelection {
    var isOpen: Bool
    let data: [ModelMusic]
    let title: String
}

let rock: [ModelMusic] = [
    ModelMusic(artist: "Alberto Ruiz - 7 Elements (Original Mix)", cover: "Alberto Ruiz - 7 Elements (Original Mix)", rating: 5),
    ModelMusic(artist: "Dave Wincent - Red Eye (Original Mix)", cover: "Dave Wincent - Red Eye (Original Mix)", rating: 2),
    ModelMusic(artist: "E-Spectro - End Station (Original Mix)", cover: "E-Spectro - End Station (Original Mix)", rating: 3),
    ModelMusic(artist: "Edna Ann - Phasma (Konstantin Yoodza Remix)", cover: "Edna Ann - Phasma (Konstantin Yoodza Remix)", rating: 7)
]

let pop: [ModelMusic] = [
    ModelMusic(artist: "Ilija Djokovic - Delusion (Original Mix)", cover: "Ilija Djokovic - Delusion (Original Mix)", rating: 2),
    ModelMusic(artist: "John Baptiste - Mycelium (Original Mix)", cover: "John Baptiste - Mycelium (Original Mix)", rating: 4),
    ModelMusic(artist: "Lane 8 - Fingerprint (Original Mix)", cover: "Lane 8 - Fingerprint (Original Mix)", rating: 0)
]

let jazz: [ModelMusic] = [
    ModelMusic(artist: "Mac Vaughn - Pink Is My Favorite Color (Alex Stein Remix)", cover: "Mac Vaughn - Pink Is My Favorite Color (Alex Stein Remix)", rating: 2),
    ModelMusic(artist: "Metodi Hristov, Gallya - Badmash (Original Mix)", cover: "Metodi Hristov, Gallya - Badmash (Original Mix)", rating: 4),
    ModelMusic(artist: "Veerus, Maxie Devine - Nightmare (Original Mix)", cover: "Veerus, Maxie Devine - Nightmare (Original Mix)", rating: 10)
]

var modelSelection: [ModelSelection] = [
    ModelSelection(isOpen: true, data: rock, title: "Rock"),
    ModelSelection(isOpen: true, data: pop, title: "Pop"),
    ModelSelection(isOpen: true, data: jazz, title: "Jazz")
]
