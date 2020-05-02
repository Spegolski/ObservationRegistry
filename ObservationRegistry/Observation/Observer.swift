//
//  Observer.swift
//  Observable
//
//  Created by Uladzislau Kachan on 4/28/20.
//  Copyright © 2020 Uladzislau Kachan. All rights reserved.
//

import Foundation

protocol Observer: AnyObject {
    typealias Action = () -> Void
    
    func subscribe<Event: Any>(to event: Event, actionHandler: @escaping Action) where Event: Convertible
    func unsubscribe<Event: Any>(from event: Event) where Event: Convertible
}

extension Observer {
    func subscribe<Event: Any>(to event: Event, actionHandler: @escaping Action) where Event: Convertible {
        var subscription = self.subscription
        subscription.add(actionHandler)
        Registry.shared.add(subscription, to: event.identifier)
    }
    
    func unsubscribe<Event: Any>(from event: Event) where Event: Convertible {
        Registry.shared.remove(self.subscription, from: event.identifier)
    }

    private var subscription: Subscription {
        return Subscription(observer: self)
    }
}

class FirstObserver: Observer {
    func subscribeToEvents() {
        self.subscribe(to: FirstObservable.Values.didChangeValue, actionHandler: { [weak self] in
            self?.didChangeValue()
        })
        self.subscribe(to: SecondObservable.Values.didTapButton, actionHandler: { [weak self] in
            self?.didTapButton()
        })
    }
    
    @objc
    func didChangeValue() {
        
    }
    
    @objc
    func didTapButton() {
        
    }
}

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
