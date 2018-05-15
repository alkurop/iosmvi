//
//  ResultBus.swift
//  iosmvi
//
//  Created by Alexey Kuropiantnyk on 15/05/2018.
//  Copyright © 2018 Alexey Kuropiantnyk. All rights reserved.
//

import Foundation
import RxSwift

public struct VCResult {
    let requestId: Int
    let result: [String: Any]
    
    public init(requestId: Int, result: [String: Any]) {
        self.result = result
        self.requestId = requestId
    }
}

public let resultBus = PublishSubject<VCResult>()
