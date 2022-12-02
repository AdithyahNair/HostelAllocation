//
//  Student.swift
//  HostelAllocation
//
//  Created by Adithyah Nair on 02/12/22.
//

import Foundation

struct Student: Codable {
    let firstName: String
    let lastName: String
    let mobileNumber: String
    let dept: String
    let yearOfStudy: String
    let hostelID: Int
    let roomID: Int
    let hostelName: String
}

class StudentModel {
    // MARK: - Properties

    weak var delegate: NetworkDelegate?
    let networkModel = Network()

    // MARK: - Functions
    
    func downloadStudentData(params: [String: Any], url: String) {
        let request = networkModel.request(params: params, url: url)
        networkModel.response(request: request) { data in
            let model = try! JSONDecoder().decode([Student].self, from: data) as [Student]?
            self.delegate?.didReceiveData(data: model! as [Student])
        }
    }
}
