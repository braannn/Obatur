//
//  ListObatViewController.swift
//  Obatur
//
//  Created by Muhammad Syabran on 13/10/20.
//

import UIKit

class ListObatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var hargaObatTableView: UITableView!
    @IBOutlet weak var prescriptionTableView: UITableView!
    
    var dataHarga : [String] = []
    var dataPrescription = [String]()
    
    let data1 = ["syabran","jason","Fikri","sabariman","hendy","ricky","edrick"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
        hargaObatTableView.delegate = self
        prescriptionTableView.delegate = self
        hargaObatTableView.dataSource = self
        prescriptionTableView.dataSource = self
        
        for index in 0...20 {
            dataHarga.append("data harga obat \(index)")
        }
        dataPrescription.append(contentsOf: data1)

        
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
//        let searchController = UISearchController(searchResultsController: nil)
//        navigationItem.searchController = searchController
//        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRow = 1
        switch tableView {
        case hargaObatTableView:
            numberOfRow = dataHarga.count
        case prescriptionTableView:
            numberOfRow = dataPrescription.count
        default:
            print("somethings wrong !!")
        }
        return numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch tableView {
        case hargaObatTableView:
            cell = tableView.dequeueReusableCell(withIdentifier: "hargaObat", for: indexPath)
            cell.textLabel?.text = dataHarga[indexPath.row]
        case prescriptionTableView:
            cell = tableView.dequeueReusableCell(withIdentifier: "prescriptionObat", for: indexPath)
            cell.textLabel?.text = dataPrescription[indexPath.row]
        default:
            print("somethings wrong !!")
        }
        return cell
    }
}
