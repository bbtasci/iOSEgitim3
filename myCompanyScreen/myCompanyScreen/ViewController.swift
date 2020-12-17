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
    var totalSalary: Int = 0
    
    let baris = Assistant()
    let berkin = Assistant()
    let ahmet = Director()
    
    let myCompany = CompanyP()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add employee Baris
        baris.age = 20
        baris.name = "Barış"
        
        // Add employee Baris
        berkin.age = 25
        berkin.name = "Berkin"
        
        // Add employee Baris
        ahmet.age = 30
        ahmet.name = "Tasci"
        
        myCompany.workers = [baris, berkin, ahmet]
        
        
        // compNameLabel view change, only left-top and right-top corner radius
        compNameLabel.clipsToBounds = true
        compNameLabel.layer.cornerRadius = 10
        compNameLabel.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        // numberOfWorkerLabel view change, only left-bottom corner radius
        numberOfWorkerLabel.clipsToBounds = true
        numberOfWorkerLabel.layer.cornerRadius = 10
        numberOfWorkerLabel.layer.maskedCorners = .layerMinXMaxYCorner
        numberOfWorkerLabel.text = "# of employees: " + String(myCompany.workers.count)
        
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
        
        
        /*
        print(baris.getCost())
        print(berkin.getCost())
        print(ahmet.getCost())
        print(myCompany.workers.count)
        */
        
        //TotalSalary
        for name in myCompany.workers {
            totalSalary += name.getCost()
            //print(totalSalary)
            
        }
        
    }
    
    //When bottom three buttons are touched
    @IBAction func paySalaryButtonTouched(_ sender: Any) {
        //budget -= totalSalary
        budget -= totalSalary
        companyBudgetLabel.text = "budget: $" + String(budget)
        salaryPayInfoLabel.text = "Salaries are paid!"
    }
    
    @IBAction func addIncomeButtonTouched(_ sender: Any) {
        // income add edilince budget'ı artır
        addingInfoLabel.text = "Income added: " + "$" + (addMoneyTF.text ?? "")
        
        if let income = Int(addMoneyTF.text ?? "0") {
            budget += income
            companyBudgetLabel.text = "budget: $" + String(budget)
        }
    }
    
    @IBAction func addOutcomeButtonTouched(_ sender: Any) {
        //outcome add edilince budget azalt
        addingInfoLabel.text = "Outcome added: " + "$" + (addMoneyTF.text ?? "")
        
        if let outcome = Int(addMoneyTF.text ?? "0") {
            budget -= outcome
            companyBudgetLabel.text = "budget: $" + String(budget)
        }
    }
    
    // Text field to enter money amount to add as income or outcome
    @IBAction func addMoneyTFFilled(_ sender: Any) {
        // sadece integer kabul et
        //self.view.makeToast("Please enter only number!", duration: 2.0, position: .center)
    }
    
    //Filling boxes to add new worker
    @IBAction func enterNameTFFilled(_ sender: Any) {
    }
    @IBAction func enterAgeTFFilled(_ sender: Any) {
    }
    @IBAction func enterJobPositionTFFilled(_ sender: Any) {
    }
    
    @IBAction func addWorkerButtonPressed(_ sender: Any) {
        
        //herhangi biri boşsa kabul etme if koy
        if enterNameTF.text == "" {
            self.view.makeToast("Please enter your name", duration: 2.0, position: .center)
        } else if enterAgeTF.text == "" {
            self.view.makeToast("Please enter you age", duration: 2.0, position: .center)
        } else if enterJobPositionTF.text == "" {
            self.view.makeToast("Please enter your position", duration: 2.0, position: .center)
        } else {
            self.view.makeToast("New employee is added!", duration: 2.0, position: .center)
        }
    }
}



// SALARY CALCULATIONS
protocol CostProtocol {
    func getCost() -> Int
}

class EmployeeP: CostProtocol {
    var age: Int = 0
    var name: String = ""
    var cost: Int = 0
    
    func getCost() -> Int{
        return 10000
    }
}

class Assistant: EmployeeP {
    override func getCost() -> Int {
        return super.getCost() + age * 100
    }
}

class Director: EmployeeP {
    override func getCost() -> Int {
        return super.getCost() + age * 200
    }
}

class CompanyP {
    var workers: [EmployeeP] = []

}


//let company2 = CompanyP()
//company2.array = [Assistant(), Director(), Director(), EmployeeP()]
