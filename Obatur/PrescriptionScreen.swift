//
//  PrescriptionScreen.swift
//  Obatur
//
//  Created by Muhammad Syabran on 18/10/20.
//

import UIKit

class PrescriptionScreen: UIViewController {
    
    @IBOutlet weak var namaPasienTxt: UILabel!
    @IBOutlet weak var umurPasienTxt: UILabel!
    @IBOutlet weak var btnKirimOutlet: UIButton!
    
    var namaPasien = ""
    var umurPasien = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.namaPasienTxt.text = namaPasien
        self.umurPasienTxt.text = umurPasien
        
        // custom button
        // corner radius
        btnKirimOutlet.layer.cornerRadius = 10
        // shadow
        btnKirimOutlet.layer.shadowColor = UIColor.black.cgColor
        btnKirimOutlet.layer.shadowOffset = CGSize(width: 0, height: 0)
        btnKirimOutlet.layer.shadowOpacity = 0.3
        btnKirimOutlet.layer.shadowRadius = 4.0
    }
}
