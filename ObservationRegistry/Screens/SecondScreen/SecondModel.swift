//
//  Model.swift
//  ObservationRegistry
//
//  Created by Uladzislau Kachan on 5/2/20.
//  Copyright © 2020 Uladzislau Kachan. All rights reserved.
//

import Foundation

protocol SecondModel: AnyObject {
    var value: String? { get }
    func update(value: String?)
}

class SecondDefaultModel {
        
    let service: RecordingService
    
    init(service: RecordingService) {
        self.service = service
    }
}

// MARK: - Model protocol implementation
extension SecondDefaultModel: SecondModel {
    var value: String? {
        return self.service.enteredValue
    }
    
    func update(value: String?) {
        self.service.update(value: value)
    }
}
