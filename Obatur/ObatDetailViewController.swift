//
//  ObatDetailViewController.swift
//  Obatur
//
//  Created by Muhammad Syabran on 19/10/20.
//

import UIKit

class ObatDetailViewController: UIViewController {
    
    @IBOutlet weak var popoverView: UIView!
    @IBOutlet weak var btnAturan1: UIButton!
    @IBOutlet weak var btnAturan2: UIButton!
    @IBOutlet weak var btnAturan3: UIButton!
    @IBOutlet weak var btnHari1: UIButton!
    @IBOutlet weak var btnHari2: UIButton!
    @IBOutlet weak var btnHari3: UIButton!
    @IBOutlet weak var txtKomposisiObat: UILabel!
    
    var namaObat = ""
    var catatan = ""
    var aturan = ""
    var hari = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customLayer()
        
        txtKomposisiObat?.text = "\(namaObat)"
        
    }
        
    func customLayer() {
        
        popoverView.layer.cornerRadius = 15
        
        btnHari3.setTitle("7 hari", for: .normal)
        btnHari3.layer.cornerRadius = 10
        btnHari3.layer.shadowColor = UIColor.black.cgColor
        btnHari3.layer.shadowOffset = CGSize(width: 0, height: 0)
        btnHari3.layer.shadowOpacity = 0.3
        btnHari3.layer.shadowRadius = 2.0
        
        btnHari2.setTitle("5 hari", for: .normal)
        btnHari2.layer.cornerRadius = 10
        btnHari2.layer.shadowColor = UIColor.black.cgColor
        btnHari2.layer.shadowOffset = CGSize(width: 0, height: 0)
        btnHari2.layer.shadowOpacity = 0.3
        btnHari2.layer.shadowRadius = 2.0
        
        btnHari1.setTitle("3 hari", for: .normal)
        btnHari1.layer.cornerRadius = 10
        btnHari1.layer.shadowColor = UIColor.black.cgColor
        btnHari1.layer.shadowOffset = CGSize(width: 0, height: 0)
        btnHari1.layer.shadowOpacity = 0.3
        btnHari1.layer.shadowRadius = 2.0
        
        btnAturan1.setTitle("1x1", for: .normal)
        btnAturan1.layer.cornerRadius = 10
        btnAturan1.layer.shadowColor = UIColor.black.cgColor
        btnAturan1.layer.shadowOffset = CGSize(width: 0, height: 0)
        btnAturan1.layer.shadowOpacity = 0.3
        btnAturan1.layer.shadowRadius = 2.0
        
        btnAturan2.setTitle("2x1", for: .normal)
        btnAturan2.layer.cornerRadius = 10
        btnAturan2.layer.shadowColor = UIColor.black.cgColor
        btnAturan2.layer.shadowOffset = CGSize(width: 0, height: 0)
        btnAturan2.layer.shadowOpacity = 0.3
        btnAturan2.layer.shadowRadius = 2.0
        
        btnAturan3.setTitle("3x1", for: .normal)
        btnAturan3.layer.cornerRadius = 10
        btnAturan3.layer.shadowColor = UIColor.black.cgColor
        btnAturan3.layer.shadowOffset = CGSize(width: 0, height: 0)
        btnAturan3.layer.shadowOpacity = 0.3
        btnAturan3.layer.shadowRadius = 2.0
    }
    
    // for hide keyboard by touch view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    // for hide keyboard by return
    private func textViewShouldReturn(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return (true)
    }
    
    func pressed() {
        let button = UIButton()
        if (button.isSelected) {
                print(" Not Selected");
            } else {
                print(" Selected");
            }
    }
    
    @IBAction func aturan1x1Btn(_ sender: Any) {
        pressed()
        aturan = "1x1"
    }
    
    @IBAction func aturan2x1Btn(_ sender: Any) {
        pressed()
        aturan = "2x1"
    }
    
    @IBAction func aturan3x1Btn(_ sender: Any) {
        pressed()
        aturan = "3x1"
    }
    
    @IBAction func hari3Btn(_ sender: Any) {
        pressed()
        hari = "3 hari"
    }
    
    @IBAction func hari5Btn(_ sender: Any) {
        pressed()
        hari = "5 hari"
    }
    @IBAction func hari7Btn(_ sender: Any) {
        pressed()
        hari = "7 Hari"
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "savedDetailObat" {
            let vc = segue.destination as! MainViewController
            vc.obat = self.namaObat
            vc.aturan = self.aturan
            vc.hari = self.hari
//        } else if segue.identifier == "detailObat" {
//            if let indexPath = hargaObatTableView.indexPathForSelectedRow {
//                let selectedRow = indexPath.row
//                let vc = segue.destination as! ObatDetailViewController
//                vc.namaObat = self.filteredData[selectedRow]
//            }
        }
    }
}


