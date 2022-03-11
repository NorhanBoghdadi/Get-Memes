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

    private lazy var memesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MemesTableViewCell.self, forCellReuseIdentifier: reuseIdentefier)
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HomeViewModel(viewController: self)
        setupTableView()
    }
    
    //MARK:- Setting the tableView
    private func setupTableView() {
        view.addSubview(memesTableView)
        NSLayoutConstraint.activate([
            memesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            memesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            memesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            memesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }


}

//MARK: - TableView Delegate and Data Source
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfMemes ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = memesTableView.dequeueReusableCell(withIdentifier: reuseIdentefier) as! MemesTableViewCell
        
        guard let data = (viewModel?.data(for: indexPath)) else {return cell}
        
        cell.configure(for: data)
        
        return cell
    }
    
    
}

// MARK: - Protocol Extension
extension ViewController: NotifaiableController {
    func dataLoaded() {
        memesTableView.reloadData()
    }
    
}
