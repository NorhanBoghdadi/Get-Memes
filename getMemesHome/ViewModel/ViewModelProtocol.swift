//
//  ViewModelProtocol.swift
//  getMemes
//
//  Created by Norhan Boghdadi on 3/11/22.
//

import Foundation

protocol ViewModelProtocol: AnyObject {
    var viewController: NotifaiableController? { get }
    var numberOfMemes: Int { get }
    func data(for cellAt: IndexPath) -> Meme

}

protocol NotifaiableController: AnyObject {
    func dataLoaded()
}
