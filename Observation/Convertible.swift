//
//  Convertible.swift
//  ObservationRegistry
//
//  Created by Uladzislau Kachan on 5/2/20.
//  Copyright © 2020 Uladzislau Kachan. All rights reserved.
//

import Foundation

protocol Convertible: Hashable {
    var identifier: Int { get }
}

extension Convertible {
    var identifier: Int {
        return self.hashValue
    }
}
