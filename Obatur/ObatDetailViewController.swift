//
//  ObatDetailViewController.swift
//  Obatur
//
//  Created by Muhammad Syabran on 19/10/20.
//

import UIKit

class ObatDetailViewController: UIViewController {
    
    @IBOutlet weak var btnAturan1: UIButton!
    @IBOutlet weak var btnAturan2: UIButton!
    @IBOutlet weak var btnAturan3: UIButton!
    @IBOutlet weak var btnHari1: UIButton!
    @IBOutlet weak var btnHari2: UIButton!
    @IBOutlet weak var btnHari3: UIButton!
    @IBOutlet weak var txtKomposisiObat: UILabel!
    
    var kategori = ""
    var namaObat = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customButton()
        
        txtKomposisiObat?.text = "\(kategori) (\(namaObat), )"
        
    }
        
    func customButton() {
        
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
}

