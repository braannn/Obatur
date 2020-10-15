//
//  ListObatViewController.swift
//  Obatur
//
//  Created by Muhammad Syabran on 13/10/20.
//

import UIKit

class ListObatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var hargaObatTableView: UITableView!
    @IBOutlet weak var prescriptionTableView: UITableView!
    @IBOutlet weak var lisObatSearchBar: UISearchBar!
    
    var dataHarga : [String] = []
    var dataPrescription = [String]()
    
    let data1 = ["syabran","jason","Fikri","sabariman","hendy","ricky","edrick"]
    var filteredData: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
        hargaObatTableView.delegate = self
        prescriptionTableView.delegate = self
        hargaObatTableView.dataSource = self
        prescriptionTableView.dataSource = self
        lisObatSearchBar.delegate = self
        
        
        for index in 0...20 {
            dataHarga.append("data harga obat \(index)")
            filteredData = dataHarga
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
            numberOfRow = filteredData.count
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
            cell.textLabel?.text = filteredData[indexPath.row]
        case prescriptionTableView:
            cell = tableView.dequeueReusableCell(withIdentifier: "prescriptionObat", for: indexPath)
            cell.textLabel?.text = dataPrescription[indexPath.row]
        default:
            print("somethings wrong !!")
        }
        return cell
    }
    
    // MARK: search bar config
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        if searchText == "" {
            filteredData = dataHarga
        }
        else {
            for testData in dataHarga {
                if testData.lowercased().contains(searchText.lowercased()) {
                    
                    filteredData.append(testData)
                }
            }
        }
        self.hargaObatTableView.reloadData()
    }
}
