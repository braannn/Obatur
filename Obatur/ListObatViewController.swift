//
//  ListObatViewController.swift
//  Obatur
//
//  Created by Muhammad Syabran on 19/10/20.
//

import UIKit

class ListObatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UITextFieldDelegate {
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     
        
        
        for index in 0...20 {
            dataHarga.append("data harga obat \(index)")
            filteredData = dataHarga
        }
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRow = 1
        switch tableView {
        
        default:
            print("somethings wrong !!")
        }
        return numberOfRow
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch tableView {
        
        default:
            print("somethings wrong !!")
        }
        return cell
    }
    
    
    
//    }
}
