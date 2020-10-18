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
    
    var namaPasien = ""
    var umurPasien = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.namaPasienTxt.text = namaPasien
        self.umurPasienTxt.text = umurPasien
    }
}
