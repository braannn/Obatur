//
//  ListObatViewController.swift
//  Obatur
//
//  Created by Muhammad Syabran on 13/10/20.
//

import UIKit

class ListObatViewController: UIViewController {
    
    
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var dokterTxt: UILabel!
    @IBOutlet weak var spesialisTxt: UILabel!
    @IBOutlet weak var rumahSakitTxt: UILabel!
    @IBOutlet weak var pasienIdTxt: UILabel!
    @IBOutlet weak var namaPasienTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}
