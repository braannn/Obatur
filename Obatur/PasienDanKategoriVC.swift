//
//  PasienDanKategoriVC.swift
//  Obatur
//
//  Created by Muhammad Syabran on 17/10/20.
//

import UIKit

class PasienDanKategoriVC: UIViewController {
    
    @IBOutlet weak var namaDokterTxt: UILabel!
    @IBOutlet weak var spesialisTxt: UILabel!
    @IBOutlet weak var rumahSktTxt: UILabel!
    
    var dokter = ""
    var spesialis = ""
    var rumahSakit = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.namaDokterTxt?.text = dokter
        self.spesialisTxt?.text = spesialis
        self.rumahSktTxt?.text = rumahSakit
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
}
