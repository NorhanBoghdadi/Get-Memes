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
    
    private lazy var MemesCollectionView: UICollectionView = {
        let memesLayout = UICollectionViewFlowLayout()
        memesLayout.scrollDirection = .vertical
        memesLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let cv = UICollectionView(frame: .zero, collectionViewLayout: memesLayout)
        cv.registerCell(cellClass: MemesCollectionViewCell.self)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .systemBackground
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HomeViewModel(viewController: self)
        view.backgroundColor = .black
        setupTitle()
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
    

    


}
//MARK: - CollectionView Delegates and DataSource
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfMemes ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = MemesCollectionView.dequeue(for: indexPath) as MemesCollectionViewCell
        
        let data = viewModel?.data(for: indexPath)
        
        cell.configure(for: data!)
        
        return cell
    }
    
}

// MARK: - Protocol Extension
extension ViewController: NotifaiableController {
    func dataLoaded() {
    }
    
}
