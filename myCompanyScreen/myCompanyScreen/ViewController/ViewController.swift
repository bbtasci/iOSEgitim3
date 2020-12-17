//
//  ViewController.swift
//  myCompanyScreen
//
//  Created by Baris Berkin Tasci on 16.12.2020.
//

import UIKit
import Toast

class ViewController: UIViewController {

    //Buttons
    @IBOutlet weak var addWorkerButton: UIButton!
    @IBOutlet weak var paySalaryButton: UIButton!
    @IBOutlet weak var addIncomeButton: UIButton!
    @IBOutlet weak var addOutcomeButton: UIButton!
    
    //Labels
    @IBOutlet weak var compNameLabel: UILabel!
    @IBOutlet weak var numberOfWorkerLabel: UILabel!
    @IBOutlet weak var companyBudgetLabel: UILabel!
    @IBOutlet weak var salaryPayInfoLabel: UILabel!
    @IBOutlet weak var addingInfoLabel: UILabel!
    
    //Text Fields
    @IBOutlet weak var enterNameTF: UITextField!
    @IBOutlet weak var enterAgeTF: UITextField!
    @IBOutlet weak var enterJobPositionTF: UITextField!
    @IBOutlet weak var addMoneyTF: UITextField!
    
    //Initial budget is 1.000.000
    var budget: Int = 1000000

    let baris = Assistant()
    let berkin = Assistant()
    let ahmet = Director()
    let kaan = Director()

    let myCompany = CompanyP()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add employee Baris
        baris.age = 20
        baris.name = "Barış"
          
        // Add employee Berkin
        berkin.age = 25
        berkin.name = "Berkin"

        // Add employee Ahmet
        ahmet.age = 30
        ahmet.name = "Ahmet"
        
        // Add employee Kaan
        kaan.age = 35
        kaan.name = "Kaan"
          
        myCompany.addNewEmployee(newEmployee: baris)
        myCompany.addNewEmployee(newEmployee: berkin)
        myCompany.addNewEmployee(newEmployee: ahmet)
        myCompany.addNewEmployee(newEmployee: kaan)
        
        //WIEV CHANGES
        
        // compNameLabel view change, only left-top and right-top corner radius
        compNameLabel.clipsToBounds = true
        compNameLabel.layer.cornerRadius = 10
        compNameLabel.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        // numberOfWorkerLabel view change, only left-bottom corner radius
        numberOfWorkerLabel.clipsToBounds = true
        numberOfWorkerLabel.layer.cornerRadius = 10
        numberOfWorkerLabel.layer.maskedCorners = .layerMinXMaxYCorner
        numberOfWorkerLabel.text = "# of employees: " + String(myCompany.countWorkers())
        
        // companyBudgetLabel view change, only right-bottom corner radius
        companyBudgetLabel.clipsToBounds = true
        companyBudgetLabel.layer.cornerRadius = 10
        companyBudgetLabel.layer.maskedCorners = .layerMaxXMaxYCorner
        
        // enterName text field view change
        enterNameTF.layer.borderColor = UIColor.black.cgColor
        enterNameTF.layer.borderWidth = 1
        enterNameTF.layer.cornerRadius = 10
        enterNameTF.layer.masksToBounds = true
        
        // enterAge text field view change
        enterAgeTF.layer.borderColor = UIColor.black.cgColor
        enterAgeTF.layer.borderWidth = 1
        enterAgeTF.layer.cornerRadius = 10
        enterAgeTF.layer.masksToBounds = true
        
        // enterJobPosition text field view change
        enterJobPositionTF.layer.borderColor = UIColor.black.cgColor
        enterJobPositionTF.layer.borderWidth = 1
        enterJobPositionTF.layer.cornerRadius = 10
        enterJobPositionTF.layer.masksToBounds = true
        
        // addNewWorker button view change
        addWorkerButton.layer.cornerRadius = 10
        addWorkerButton.layer.masksToBounds = true
        addWorkerButton.layer.borderColor = UIColor.black.cgColor
        addWorkerButton.layer.borderWidth = 1
        //addWorkerButton.layer.backgroundColor = UIColor.yellow.cgColor
        
        // paySalary button view change
        paySalaryButton.layer.cornerRadius = 10
        paySalaryButton.layer.masksToBounds = true
        
        // salaryPayInfoLabel view change
        salaryPayInfoLabel.layer.cornerRadius = 10
        salaryPayInfoLabel.layer.masksToBounds = true
        
        // addIncomeButton view change, only top-left corner radius
        addIncomeButton.layer.cornerRadius = 10
        addIncomeButton.layer.maskedCorners = .layerMinXMinYCorner
 
        // addOutcomeButton view change, only top-right corner radius
        addOutcomeButton.layer.cornerRadius = 10
        addOutcomeButton.layer.maskedCorners = .layerMaxXMinYCorner
        
        // adding income or outcome information label view change, only left-bottom and right-bottom corner radius
        addingInfoLabel.clipsToBounds = true
        addingInfoLabel.layer.cornerRadius = 10
        addingInfoLabel.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    //When bottom three buttons are touched
    @IBAction func paySalaryButtonTouched(_ sender: Any) {
        //budget -= totalSalary
        budget -= myCompany.getTotalSalary()
        companyBudgetLabel.text = "budget: $" + String(budget)
        salaryPayInfoLabel.text = "Salaries are paid!"
    }
    
    @IBAction func addIncomeButtonTouched(_ sender: Any) {
        addingInfoLabel.text = "Income added: " + "$" + (addMoneyTF.text ?? "")
        
        if let income = Int(addMoneyTF.text ?? "0") {
            budget += income
            companyBudgetLabel.text = "budget: $" + String(budget)
        }
    }
    
    @IBAction func addOutcomeButtonTouched(_ sender: Any) {
        addingInfoLabel.text = "Outcome added: " + "$" + (addMoneyTF.text ?? "")
        
        if let outcome = Int(addMoneyTF.text ?? "0") {
            budget -= outcome
            companyBudgetLabel.text = "budget: $" + String(budget)
        }
    }
    
    // Text field to enter money amount to add as income or outcome
    @IBAction func addMoneyTFFilled(_ sender: Any) {
    }
    
    //Filling boxes to add new worker
    @IBAction func enterNameTFFilled(_ sender: Any) {
    }
    @IBAction func enterAgeTFFilled(_ sender: Any) {
    }
    @IBAction func enterJobPositionTFFilled(_ sender: Any) {
    }
    
    @IBAction func addWorkerButtonPressed(_ sender: Any) {
        
        if enterNameTF.text == "" {
            self.view.makeToast("Please enter your name", duration: 2.0, position: .center)
        } else if enterAgeTF.text == "" {
            self.view.makeToast("Please enter your age", duration: 2.0, position: .center)
        } else if enterJobPositionTF.text == "" {
            self.view.makeToast("Please enter your position", duration: 2.0, position: .center)
        } else {
            if enterJobPositionTF.text == "Director" {
                let newEmployee = Director()
                newEmployee.name = enterNameTF.text ?? ""
                newEmployee.age = Int(enterAgeTF.text ?? "0") ?? 0
                myCompany.addNewEmployee(newEmployee: newEmployee)
                numberOfWorkerLabel.text = "# of employees: " + String(myCompany.countWorkers())
                self.view.makeToast("New Director is added!", duration: 2.0, position: .center)
            } else if enterJobPositionTF.text == "Assistant" {
                let newEmployee = Assistant()
                newEmployee.name = enterNameTF.text ?? ""
                newEmployee.age = Int(enterAgeTF.text ?? "0") ?? 0
                myCompany.addNewEmployee(newEmployee: newEmployee)
                numberOfWorkerLabel.text = "# of employees: " + String(myCompany.countWorkers())
                self.view.makeToast("New Assistant is added!", duration: 2.0, position: .center)
            } else {
                self.view.makeToast("Please fill the area only with 'Director' or 'Assistant' *case sensitive area", duration: 2.0, position: .center)
            }
        }
    }
}
