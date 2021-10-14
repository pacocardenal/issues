//
//  UIHelper.swift
//  issues
//
//  Created by m_949184 on 14/10/21.
//

import UIKit

struct UIHelper {
  
  static func createOneColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
    let width = view.bounds.width
    let padding: CGFloat = 12
    let availableWidth = width - (padding * 2)
    
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    flowLayout.itemSize = CGSize(width: availableWidth, height: 100)
    return flowLayout
  }
  
}
