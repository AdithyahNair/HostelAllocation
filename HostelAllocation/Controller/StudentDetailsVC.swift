//
//  StudentDetailsVC.swift
//  HostelAllocation
//
//  Created by Adithyah Nair on 02/12/22.
//

import UIKit

class StudentDetailsVC: UIViewController {
    // MARK: - Properties

    var model: Student?

    // MARK: - IBOutlets

    @IBOutlet var lblFName: UILabel! {
        didSet {
            if model != nil{
                lblFName.text = model?.F_Name
            } else {
                lblFName.text = ""
            }
        }
    }

    @IBOutlet var lblLName: UILabel! {
        didSet {
            if model != nil{
                lblLName.text = model?.L_Name
            } else {
                lblLName.text = ""
            }
        }
    }

    @IBOutlet var lblMobileNumber: UILabel! {
        didSet {
            if model != nil{
                lblMobileNumber.text = model?.Mob_No
            } else {
                lblMobileNumber.text = ""
            }
        }
    }

    @IBOutlet var lblDepartment: UILabel! {
        didSet {
            if model != nil{
                lblDepartment.text = model?.Dept
            } else {
                lblDepartment.text = ""
            }
        }
    }

    @IBOutlet var lblYear: UILabel! {
        didSet {
            if model != nil{
                lblYear.text = model?.Year_Of_Study
            } else {
                lblYear.text = ""
            }
        }
    }

    @IBOutlet var lblHostelID: UILabel! {
        didSet {
            if model != nil{
                lblHostelID.text = model?.Hostel_ID.codingKey.stringValue
            } else {
                lblHostelID.text = ""
            }
        }
    }

    @IBOutlet var lblHostelName: UILabel! {
        didSet {
            if model != nil{
                lblHostelName.text = model?.Hostel_Name
            } else {
                lblHostelName.text = ""
            }
        }
    }

    @IBOutlet var lblRoomNumber: UILabel! {
        didSet {
            if model != nil{
                lblRoomNumber.text = model?.Room_ID.codingKey.stringValue
            } else {
                lblRoomNumber.text = ""
            }
        }
    }

    // MARK: - Functions

    func setUp() {
        navigationItem.title = "Profile"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(tappedBackButton))
    }

    @objc func tappedBackButton() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}
