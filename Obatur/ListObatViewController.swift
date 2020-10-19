//
//  ListObatViewController.swift
//  Obatur
//
//  Created by Muhammad Syabran on 19/10/20.
//

import UIKit

class ListObatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UITextFieldDelegate {
    
    
    @IBOutlet weak var hargaObatTableView: UITableView!
    @IBOutlet weak var listObatSearchBar: UITableView!
    
    var dataHarga : [String] = []
    var filteredData: [String]!
    var medicineArray = [Medicines]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        loadMedicine()
     
        hargaObatTableView.delegate = self
        hargaObatTableView.dataSource = self
        listObatSearchBar.delegate = self
        
        for index in 0...20 {
            dataHarga.append("data harga obat \(index)")
            filteredData = dataHarga
        }
        
        for medicine in medicineArray {
            dataHarga.append(medicine.name!)
            filteredData = dataHarga
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRow = 1
        switch tableView {
        case hargaObatTableView:
            numberOfRow = filteredData.count
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
    
//    func loadMedicine() {
//        let request: NSFetchRequest<Medicines> = Medicines.fetchRequest()
//        do {
//            medicineArray = try context.fetch(request)
//        }
//        catch {
//            print("Error fetching data from context \(error)")
//        }
//    }
}
