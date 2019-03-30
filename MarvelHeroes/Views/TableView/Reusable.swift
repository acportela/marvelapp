//
//  Reusable.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/30/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

public protocol Reusable {
    static var reusableIdentifier: String { get }
}

public extension Reusable {
    static var reusableIdentifier: String {
        return "\(Self.self)"
    }
}

public extension UITableView {
    
    public func register<R: UITableViewCell & Reusable>(_ reusable: R.Type = R.self) {
        register(R.self, forCellReuseIdentifier: R.reusableIdentifier)
    }
    
    public func dequeue<R: UITableViewCell & Reusable>(_ reusable: R.Type = R.self, indexPath: IndexPath) -> R {
        guard let cell = dequeueReusableCell(withIdentifier: R.reusableIdentifier, for: indexPath) as? R else {
            fatalError("Cell is not registered - call tableView.register(Cell.Type) to register first before using.")
        }
        
        return cell
    }
    
}
