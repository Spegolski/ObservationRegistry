//
//  Registry.swift
//  Observable
//
//  Created by Uladzislau Kachan on 4/28/20.
//  Copyright © 2020 Uladzislau Kachan. All rights reserved.
//

import Foundation

class Registry: NSObject {
    static var shared = Registry()

    private override init() { }
    
    var subscriptions: [Int: [Subscription]] = [:]
    
    func add(_ subscription: Subscription, to eventId: Int) {
        // TODO: - It may be necessary to check the observer duplication for each key
        if self.subscriptions[eventId] != nil {
            self.subscriptions[eventId]?.append(subscription)
        } else {
            self.subscriptions[eventId] = [subscription]
        }
    }
    
    func remove(_ subscription: Subscription, from eventId: Int) {
        guard let index = self.subscriptions[eventId]?.firstIndex(where: {
            $0.observer === subscription.observer
        }) else {
            return
        }
        self.subscriptions[eventId]?.remove(at: index)
    }
    
    func fire(event withId: Int) {
        guard let subscribers = self.subscriptions[withId] else {
            return
        }
        subscribers.forEach({ subscriber in
            if subscriber.observer != nil {
                subscriber.actionHandler?()
            }
        })
    }
}
