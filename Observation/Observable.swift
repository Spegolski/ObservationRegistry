//
//  Observable.swift
//  Observable
//
//  Created by Uladzislau Kachan on 5/2/20.
//  Copyright © 2020 Uladzislau Kachan. All rights reserved.
//

import Foundation

protocol Observable {
    associatedtype `Event` where Event: Convertible

    func notify(event: Event)
}

extension Observable {
    func notify(event: Event) {
        Registry.shared.fire(event: event.identifier)
    }
}
