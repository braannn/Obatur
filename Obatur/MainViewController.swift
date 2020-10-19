//
//  ListObatViewController.swift
//  Obatur
//
//  Created by Muhammad Syabran on 13/10/20.
//

import UIKit
import CoreData

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var prescriptionTableView: UITableView!
    @IBOutlet weak var namaDokterTxt: UILabel!
    @IBOutlet weak var spesialisTxt: UILabel!
    @IBOutlet weak var rumahSktTxt: UILabel!
    @IBOutlet weak var dateTxtField: UITextField!
    @IBOutlet weak var namaPasienTxt: UITextField!
    @IBOutlet weak var hargaObatTableView: UITableView!
    @IBOutlet weak var listObatSearchBar: UISearchBar!
    @IBOutlet weak var btnOutlet: UIButton!
    
    //Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var doctorArray = [Doctors]()
    var medicineDictionary = [Medicines]()
    
    var dokter: String = ""
    var spesialis: String = ""
    var rumahSakit: String = ""
    var dataPasien = ""
    var umurPasien = ""
    
    var namaObat = [String]()
    var hargaObat = [Int64]()
    var filteredData = [String]()
    var dataPrescription = [String]()

    
    let datePicker = UIDatePicker()
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.locale = .current
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        createDatePicker()
        loadDoctor()
        loadMedicine()
        
        for doctor in doctorArray {
            namaDokterTxt.text = doctor.name
            spesialisTxt.text = doctor.specialty
            rumahSktTxt.text = doctor.hospital
        }
        
        for medicine in medicineDictionary {
            namaObat.append(medicine.name!)
            filteredData = namaObat
            hargaObat.append(medicine.price)
        }
        
        hargaObatTableView.delegate = self
        hargaObatTableView.dataSource = self
        listObatSearchBar.delegate = self
        prescriptionTableView.delegate = self
        prescriptionTableView.dataSource = self
        self.namaPasienTxt.delegate = self
        self.dateTxtField.delegate = self

        namaPasienTxt.textAlignment = .center
        
        // custom button
        // corner radius
        btnOutlet.layer.cornerRadius = 10
        // shadow
        btnOutlet.layer.shadowColor = UIColor.black.cgColor
        btnOutlet.layer.shadowOffset = CGSize(width: 0, height: 0)
        btnOutlet.layer.shadowOpacity = 0.3
        btnOutlet.layer.shadowRadius = 4.0
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
    //mark: for large title in navigation bar
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // mark: config for each table view
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
            cell.detailTextLabel?.text = String(hargaObat[indexPath.row])
        case prescriptionTableView:
            cell = tableView.dequeueReusableCell(withIdentifier: "prescriptionObat", for: indexPath)
            cell.textLabel?.text = dataPrescription[indexPath.row]
        default:
            print("Somethings wrong !!")
        }
        return cell
    }
    
    // MARK: search bar config
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        if searchText == "" {
            filteredData = namaObat
        }
        else {
            for testData in namaObat {
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
    //Load Medicine list
    func loadMedicine() {
        let request: NSFetchRequest<Medicines> = Medicines.fetchRequest()
        do {
            medicineDictionary = try context.fetch(request)
        }
        catch {
            print("Error fetching data from context \(error)")
        }
    }

    @IBAction func btnKonfirmasi(_ sender: Any) {
        self.dataPasien = namaPasienTxt.text!
        
        //formatter for date picker
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
        if segue.identifier == "kirimData" {
            let vc = segue.destination as! PrescriptionScreen
            vc.namaPasien = self.namaPasienTxt.text!
            vc.umurPasien = self.umurPasien
        }
    }
}
