//
//  RecordingService.swift
//  ObservationRegistry
//
//  Created by Uladzislau Kachan on 5/2/20.
//  Copyright © 2020 Uladzislau Kachan. All rights reserved.
//

import Foundation

protocol RecordingService: AnyObject {
    var enteredValue: String? { get }
    
    func update(value: String?)
}

class RecordingServiceImpl: RecordingService {
    /* List of events available to observation */
    enum Events: Convertible {
        case didChangeValue
    }
    
    private(set) public var enteredValue: String? = "Test" {
        didSet {
            if oldValue != self.enteredValue {
                self.notify(event: .didChangeValue)
            }
        }
    }
    
    init() {
        self.setupSubscriptions()
    }
    
    func update(value: String?) {
        self.enteredValue = value
    }
    
    private func setupSubscriptions() {
        self.subscribe(
            to: AppDelegate.Events.didEnterBackground,
            actionHandler: { [weak self] in
                self?.release()
            }
        )
    }
    
    private func release() {
        /* Send the value to the server for example */
        self.enteredValue = nil
    }
}

// MARK: - The implementation of the `Observable` protocol to make this class available to observation
extension RecordingServiceImpl: Observable {
    typealias `Event` = Events
}

// MARK: - The implementation of the `Observer` protocol to allow this class to subscribe to any available events
extension RecordingServiceImpl: Observer { }
