//
//  Weak.swift
//  Weak
//
//  Created by luojie on 2017/10/2.
//  Copyright © 2017年 LuoJie. All rights reserved.
//

// 0 Parameter

public func `weak`<WeakOwner>(_ owner: WeakOwner, closure: @escaping (WeakOwner) -> Void)
    -> () -> Void where WeakOwner: AnyObject {
        return weak(owner, default: (), closure: closure)
}

public func `weak`<WeakOwner, R>(_ owner: WeakOwner, default valueFactory: @autoclosure @escaping () -> R, closure: @escaping (WeakOwner) -> R)
    -> () -> R where WeakOwner: AnyObject {
        return { [weak owner] in
            guard let strongOwner = owner else { return valueFactory() }
            return closure(strongOwner)
        }
}

// 1 Parameter

public func `weak`<WeakOwner, P>(_ owner: WeakOwner, closure: @escaping (WeakOwner, P) -> Void)
    -> (P) -> Void where WeakOwner: AnyObject {
        return weak(owner, default: (), closure: closure)
}

public func `weak`<WeakOwner, P, R>(_ owner: WeakOwner, default valueFactory: @autoclosure @escaping () -> R, closure: @escaping (WeakOwner, P) -> R)
    -> (P) -> R where WeakOwner: AnyObject {
        return { [weak owner] parameter in
            guard let strongOwner = owner else { return valueFactory() }
            return closure(strongOwner, parameter)
        }
}
