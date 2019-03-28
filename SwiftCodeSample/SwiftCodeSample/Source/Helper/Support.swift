//
//  Support.swift
//  SwiftCodeSample
//
//  Created by Serik on 3/26/19.
//  Copyright © 2019 Serik_Klement. All rights reserved.
//

import Foundation

func DLog(_ object: Any)
{
    #if DEBUG
    print(object)
    #endif
}

public struct Support
{
    @inline(__always) public static func stringForClass(_ aClass : AnyClass) -> String {
        return String(describing: aClass.self)
    }
}

// MARK: ObserverPattern Support Extension

extension Support
{
    open class Observer<T: AnyObject>: Hashable {
        open weak var value : T?
        public init (value: T) {
            self.value = value
        }
        
        open var hashValue: Int {
            return (value == nil) ? 0 : unsafeBitCast(value!, to: Int.self)
        }
    }
}

// MARK: Equatable

public func ==<T>(lhs: Support.Observer<T>, rhs: Support.Observer<T>) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

// MARK: ObserverPattern

@available(*, deprecated, message: "Use Support.Observer without struct Observers namespace")
public struct Observers {
    public typealias Observer = Support.Observer
}

// MARK: ObserverPatternProtocol

public protocol ObserverPatternProtocol: class {
    var observers: Set<Support.Observer<AnyObject>> { get set }
}

public protocol ObserverPatternObservingProtocol: class {
    func dataSource(_ sender: Any, didUpdateWithError error: Error?, userInfo: Any?)
}

extension ObserverPatternProtocol
{
    public func addObserver(_ observer: ObserverPatternObservingProtocol?) {
        if observer != nil {
            observers.insert(Support.Observer(value: observer!))
        }
    }
    
    public func notifyObserversWithError(_ error: Error?, userInfo: Any? = nil)
    {
        DispatchQueue.main.async {
            for observer in self.observers {
                if let observer = observer.value as? ObserverPatternObservingProtocol {
                    observer.dataSource(self, didUpdateWithError: error, userInfo: userInfo)
                }
            }
        }
    }
}

