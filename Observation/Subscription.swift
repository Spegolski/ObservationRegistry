//
//  Subscription.swift
//  ObservationRegistry
//
//  Created by Uladzislau Kachan on 5/2/20.
//  Copyright © 2020 Uladzislau Kachan. All rights reserved.
//

import Foundation

struct Subscription {
    private(set) weak var observer: Observer?
    private(set) var actionHandler: Observer.Action?
    
    init(observer: Observer) {
        self.observer = observer
    }
    
    mutating func add(_ actionHandler: @escaping Observer.Action) {
        self.actionHandler = actionHandler
    }
}
