//
//  Reminder.swift
//  reminder
//
//  Created by Enrico Madonna on 14/11/23.
//

import Foundation
import SwiftData

@Model
class Reminder {
    var titolo: String
    var note: String
    var completato: Bool
    var contrassegnato: Bool
    //@Relationship(deleteRule: .cascade) var sights = [Sight]()

    init(titolo: String = "", note: String = "", completato: Bool = false, contrassegnato: Bool = false) {
        self.titolo = titolo
        self.note = note
        self.completato = completato
        self.contrassegnato = contrassegnato
    }
}
