//
//  Observable.swift
//  MVVMBinding
//
//  Created by Alley Pereira on 27/04/21.
//

import UIKit

//MARK: Observable
class Observable<T> {

    var value: T? {
        didSet {
            listeners.forEach {
                $0(value)
            }
        }
    }

    init(_ value: T?) {
        self.value = value
    }

    private var listeners: [((T?) -> Void)] = []

    func bind(_ listener: @escaping (T?) -> Void) {
        listener(value)
        self.listeners.append(listener)
    }
}
