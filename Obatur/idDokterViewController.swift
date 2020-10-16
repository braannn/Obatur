//
//  idDokterViewController.swift
//  Obatur
//
//  Created by Muhammad Syabran on 15/10/20.
//

import UIKit

class idDokterViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var idView: UIView!
    @IBOutlet weak var namaDokterTxtField: UITextField!
    @IBOutlet weak var spesialTxtField: UITextField!
    @IBOutlet weak var rsTxtField: UITextField!
    @IBOutlet weak var btnConfirm: UIButton!
    
    var Dokter = ""
    var spesialis = ""
    var rumahSakit = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.namaDokterTxtField.delegate = self
        self.spesialTxtField.delegate = self
        self.rsTxtField.delegate = self
        idView.layer.cornerRadius = 30
    }
    
    @IBAction func btnConfirm(_ sender: Any) {
        self.Dokter = namaDokterTxtField.text!
        self.spesialis = spesialTxtField.text!
        self.rumahSakit = rsTxtField.text!
        
        performSegue(withIdentifier: "dataSaved", sender: self)
    }
    
    // MARK = set identitas dokter ke ListObatViewController.swift
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ListObatViewController
        vc.dokter = self.namaDokterTxtField.text!
        vc.spesialis = self.spesialTxtField.text!
        vc.rumahSakit = self.rsTxtField.text!
    }
}
