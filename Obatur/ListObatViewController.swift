//
//  ListObatViewController.swift
//  Obatur
//
//  Created by Muhammad Syabran on 13/10/20.
//

import UIKit
import CoreData

class ListObatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var hargaObatTableView: UITableView!
    @IBOutlet weak var prescriptionTableView: UITableView!
    @IBOutlet weak var lisObatSearchBar: UISearchBar!
    @IBOutlet weak var namaDokterTxt: UILabel!
    @IBOutlet weak var spesialisTxt: UILabel!
    @IBOutlet weak var rumahSktTxt: UILabel!
    @IBOutlet weak var dateTxtField: UITextField!
    @IBOutlet weak var namaPasienTxt: UITextField!
    
    //Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var doctorArray = [Doctors]()
    
    var dokter: String = ""
    var spesialis: String = ""
    var rumahSakit: String = ""
    
    var dataHarga : [String] = []
    var dataPrescription = [String]()
    var dataPasien = ""
    var umurPasien = ""
    
    let data1 = ["syabran","jason","Fikri","sabariman","hendy","ricky","edrick"]
    var filteredData: [String]!
    
    let datePicker = UIDatePicker()
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.locale = .current
//        formatter.dateFormat = "yyyy"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        createDatePicker()
        loadDoctor()
        
        for doctor in doctorArray {
            namaDokterTxt.text = doctor.name
            spesialisTxt.text = doctor.specialty
            rumahSktTxt.text = doctor.hospital
            
        }
        
        hargaObatTableView.delegate = self
        prescriptionTableView.delegate = self
        hargaObatTableView.dataSource = self
        prescriptionTableView.dataSource = self
        lisObatSearchBar.delegate = self
        self.namaPasienTxt.delegate = self
        self.dateTxtField.delegate = self
        
        
        for index in 0...20 {
            dataHarga.append("data harga obat \(index)")
            filteredData = dataHarga
        }
        dataPrescription.append(contentsOf: data1)

        namaPasienTxt.textAlignment = .center
    }
    
    // mark: for date picker
    func createDatePicker() {
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done
            , target: nil, action: #selector(donePressed))
        
        toolbar.setItems([doneButton], animated: true)
        
        //assign toolbar
        dateTxtField.inputAccessoryView = toolbar
        
        //assign date picker to textfield
        dateTxtField.inputView = datePicker
        
        //date picker mode
        datePicker.datePickerMode = .date
        
        //alligment
        dateTxtField.textAlignment = .center
    }
    
    @objc func donePressed() {
        //formatter
        formatter.dateStyle = .medium
        dateTxtField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationItem.largeTitleDisplayMode = .always
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
    
    // for hide keyboard by touch view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    // for hide keyboard by return
    private func textViewShouldReturn(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return (true)
    }
    
    //Load doctor's identity
    func loadDoctor() {
        let request: NSFetchRequest<Doctors> = Doctors.fetchRequest()
        do {
            doctorArray = try context.fetch(request)
        }
        catch {
            print("Error fetching data from context \(error)")
        }
    }
    
    @IBAction func btnKonfirmasi(_ sender: Any) {
        self.dataPasien = namaPasienTxt.text!
        
        //formatter
        formatter.dateFormat = "yyyy"
        dateTxtField.text = formatter.string(from: datePicker.date)
        guard let birthYear = dateTxtField.text else { return }
        let date = Date()
        let calender = Calendar.current
        let currentYear = calender.component(.year, from: date)
        let result = currentYear - Int(birthYear)!
        
        self.umurPasien = "\(result) tahun"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PrescriptionScreen
        vc.namaPasien = self.namaPasienTxt.text!
        vc.umurPasien = self.umurPasien
    }
    
}
