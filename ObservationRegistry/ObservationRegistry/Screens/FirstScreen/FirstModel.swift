//
//  Model.swift
//  ObservationRegistry
//
//  Created by Uladzislau Kachan on 5/2/20.
//  Copyright © 2020 Uladzislau Kachan. All rights reserved.
//

import Foundation

protocol FirstModel: AnyObject {
    var value: String? { get }
}

class FirstDefaultModel {
    let service: RecordingService
    
    init(service: RecordingService) {
        self.service = service
    }
}

extension FirstDefaultModel: FirstModel {
    var value: String? {
        return self.service.enteredValue
    }
}
