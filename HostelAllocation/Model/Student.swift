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
