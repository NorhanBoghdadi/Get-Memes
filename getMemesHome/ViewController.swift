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
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ("Pick your favorite meme and laugh ;)")
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        return label
    }()
    
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
        view.backgroundColor = .black
        setupTitle()
        setupTableView()
    }
    //MARK: - Setting Title
    private func setupTitle() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: (view.frame.height) / 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    //MARK:- Setting the tableView
    private func setupTableView() {
        view.addSubview(memesTableView)
        NSLayoutConstraint.activate([
            memesTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
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
