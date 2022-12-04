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

    func downloadStudentData(query: String) {
        let request = networkModel.request(query: query)
        networkModel.response(request: request, query: query) { data in
            if let data = data {
                self.networkModel.parseJSON(data: data) { student in
                    if let _student = student {
                        if _student.count != 0 {
                            let student = _student[0]
                            self.delegate?.didReceiveData(data: student)
                        } else {
                            self.delegate?.didNotReceiveData(title: "Not found", message: "Student data not present in db")
                        }
                    }
                }
            } else {
                self.delegate?.didNotReceiveData(title: "Connection Error", message: "Could not connect to database")
            }
        }
    }
}
