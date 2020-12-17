//
//  CompanyP.swift
//  myCompanyScreen
//
//  Created by Baris Berkin Tasci on 17.12.2020.
//

import Foundation

class CompanyP {
    private var workers: [EmployeeP] = []
    private var totalSalary: Int = 0
    
    func getTotalSalary() -> Int {
        return totalSalary
    }
    
    func addNewEmployee(newEmployee: EmployeeP) {
        workers.append(newEmployee)
        totalSalary += newEmployee.getCost()
    }
    
    func countWorkers() -> Int {
        return workers.count
    }
    
    func addMultiEmployees(newEmployee: [EmployeeP]) {
        for employee in newEmployee {
            addNewEmployee(newEmployee: employee)
        }
    }
}
