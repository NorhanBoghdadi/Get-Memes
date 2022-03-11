//
//  ViewController.swift
//  getMemes
//
//  Created by Norhan Boghdadi on 3/11/22.
//

import UIKit

class ViewController: UIViewController {

    var viewModel: ViewModelProtocol?
    
    let reuseIdentefier = "reuseIden"

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HomeViewModel(viewController: self)
    }


}

// MARK: - Protocol Extension
extension ViewController: NotifaiableController {
    func dataLoaded() {
    }
    
}
