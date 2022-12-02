//
//  Student.swift
//  HostelAllocation
//
//  Created by Adithyah Nair on 02/12/22.
//

import Foundation

struct Student: Codable {
    let F_Name: String
    let L_Name: String
    let Mob_No: String
    let Dept: String
    let Year_Of_Study: String
    let Hostel_ID: Int
    let Room_ID: Int
    let Hostel_Name: String
}

class StudentModel {
    // MARK: - Properties

    weak var delegate: NetworkDelegate?
    let networkModel = Network()

    // MARK: - Functions
    
    func downloadStudentData(params: [String: Any], url: String) {
        let request = networkModel.request(params: params, url: url)
        networkModel.response(request: request) { data in
            let model = try! JSONDecoder().decode([Student]?.self, from: data) as [Student]?
            self.delegate?.didReceiveData(data: model! as [Student])
        }
    }
}
