//
//  Assistant.swift
//  myCompanyScreen
//
//  Created by Baris Berkin Tasci on 17.12.2020.
//

import Foundation

class Assistant: EmployeeP {
    override func getCost() -> Int {
        return super.getCost() + age * 100
    }
}
