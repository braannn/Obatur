//
//  CollectionViewController.swift
//  Obatur
//
//  Created by Jason Yang on 12/10/20.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    let dataSource: [String] = ["Obat 1", "Obat 2", "Obat 3", "Obat 4", "Obat 5", "Obat 6", "Obat 7", "Obat 8", "Obat 9", "Obat 10", "Obat 11", "Obat 12", "Obat 13", "Obat 14", "Obat 15", "Obat 16", "Obat 17", "Obat 18", "Obat 19", "Obat 20", "Obat 21"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            customCell.configure(with: dataSource[indexPath.row])
            cell = customCell
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Country: \(dataSource[indexPath.row])")
    }

    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles =  true
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}
