//
//  CoordinatorProtocol.swift
//  PlantLife
//
//  Created by Michael Baldock on 20/02/2019.
//  Copyright © 2019 Michael Baldock. All rights reserved.
//

import UIKit

/// API for defining how Coordinators can compose other UIViewController subclasses.
///
/// Classes express conformance to this protocol, and therefore should fulfill the role
///  of a coordinator. However, implementation of the protocol API is unnecessary as it
///  is provided by default.
protocol CoordinatorProtocol {

  /// Add a view controller as a child of the receiver
  /// The view controller's view will be, pinned to the edge of the target view.
  /// This method will perform all the necessary UIViewController containment APIs.
  ///
  /// - See:
  ///   - UIViewController.addChild(_:)
  ///
  /// - Parameters:
  ///   - child: the child (i.e. composed) `UIViewController` instance
  ///   - subview: a `UIView` instance which must be a descendent subview of the
  ///      receiver's view, and which is the target view to pin the child's view.
  func add(child childViewController:UIViewController, inside targetView:UIView)
}

extension CoordinatorProtocol where Self: UIViewController {
  
  func add(child childViewController:UIViewController, inside targetView:UIView) {
    
    assert(targetView.isDescendant(of: self.view),
           "Trying to add childVC to a view which is not a descendant of self.view")
    
    addChild(childViewController)
    
    childViewController.view.frame = CGRect(origin: .zero, size: targetView.bounds.size)
    
    targetView.addSubview(childViewController.view)
    
    NSLayoutConstraint.activate([
      childViewController.view.leadingAnchor.constraint(equalTo: targetView.leadingAnchor, constant: 0),
      childViewController.view.topAnchor.constraint(equalTo: targetView.topAnchor, constant: 0),
      childViewController.view.trailingAnchor.constraint(equalTo: targetView.trailingAnchor, constant: 0),
      childViewController.view.bottomAnchor.constraint(equalTo: targetView.bottomAnchor, constant: 0)
      ])
    
    childViewController.didMove(toParent: self)
  }
  
}
