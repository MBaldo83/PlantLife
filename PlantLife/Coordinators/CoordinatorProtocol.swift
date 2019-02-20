//
//  CoordinatorProtocol.swift
//  PlantLife
//
//  Created by Michael Baldock on 20/02/2019.
//  Copyright © 2019 Michael Baldock. All rights reserved.
//

import UIKit

protocol CoordinatorProtocol {
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
