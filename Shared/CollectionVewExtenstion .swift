//
//  CollectionViewExtension.swift
//  getMemesTests
//
//  Created by Norhan Boghdadi on 3/12/22.
//

import UIKit

enum SupplementaryViewKind {
    case header
    case footer
}

extension UICollectionView {
    
    func registerCell<Cell: UICollectionViewCell>(cellClass: Cell.Type) {
        let identifier = String(describing: Cell.self)
        self.register(Cell.self, forCellWithReuseIdentifier: identifier)
    }
    
    func dequeue<Cell: UICollectionViewCell>(for indexPath: IndexPath) -> Cell {
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError("Error in dequeue cell")
        }
        return cell
    }

}

extension UICollectionViewCell {
    
    static var identifier: String {
        return "\(self)"
    }
}
 
