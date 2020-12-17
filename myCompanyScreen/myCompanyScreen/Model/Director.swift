//
//  Director.swift
//  myCompanyScreen
//
//  Created by Baris Berkin Tasci on 17.12.2020.
//

import Foundation

class Director: EmployeeP {
    override func getCost() -> Int {
        return super.getCost() + age * 200
    }
}
