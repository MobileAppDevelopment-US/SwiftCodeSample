//
//  ValueObserved.swift
//  SwiftCodeSample
//
//  Created by Serik on 3/26/19.
//  Copyright © 2019 Serik_Klement. All rights reserved.
//

import Foundation

open class ValueObserved<T>
{
    public typealias Listener = ((T) -> ())
    
    private var listener: Listener?
    
    public init(_ aValue: T) {
        value = aValue
    }
    
    public var value: T {
        didSet {
            listener?(value)
        }
    }
    
    public func fire() {
        listener?(value)
    }
    
    public func bind(_ aListener: Listener?) {
        listener = aListener
        listener?(value)
    }
    
    public func addListener(_ aListener: Listener?) {
        listener = aListener
    }
}

open class ValueMultiObserved<T>
{
    public typealias Listener = ((T) -> ())
    private var listeners: [Listener] = []
    
    public init(_ v: T) {
        value = v
    }
    
    public var value: T {
        didSet {
            for l in listeners { l(value) }
        }
    }
    
    public func fire() {
        for l in listeners { l(value) }
    }
    
    public func bind(l: @escaping Listener) {
        listeners.append(l)
        l(value)
    }
    
    public func addListener(l: @escaping Listener) {
        listeners.append(l)
    }
}
