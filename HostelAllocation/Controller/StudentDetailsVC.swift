//
//  StudentDetailsVC.swift
//  HostelAllocation
//
//  Created by Adithyah Nair on 02/12/22.
//

import UIKit

class StudentDetailsVC: UIViewController {
    // MARK: - Properties

    var model: [Student]?

    // MARK: - IBOutlets

    @IBOutlet var lblFName: UILabel! {
        didSet {
            if model!.count != 0 {
                lblFName.text = model![0].F_Name
            } else {
                lblFName.text = ""
            }
        }
    }

    @IBOutlet var lblLName: UILabel! {
        didSet {
            if model!.count != 0 {
                lblLName.text = model![0].L_Name
            } else {
                lblLName.text = ""
            }
        }
    }

    @IBOutlet var lblMobileNumber: UILabel! {
        didSet {
            if model!.count != 0 {
                lblMobileNumber.text = model![0].Mob_No
            } else {
                lblMobileNumber.text = ""
            }
        }
    }

    @IBOutlet var lblDepartment: UILabel! {
        didSet {
            if model!.count != 0 {
                lblDepartment.text = model![0].Dept
            } else {
                lblDepartment.text = ""
            }
        }
    }

    @IBOutlet var lblYear: UILabel! {
        didSet {
            if model!.count != 0 {
                lblYear.text = model![0].Year_Of_Study
            } else {
                lblYear.text = ""
            }
        }
    }

    @IBOutlet var lblHostelID: UILabel! {
        didSet {
            if model!.count != 0 {
                lblHostelID.text = String(model![0].Hostel_ID)
            } else {
                lblHostelID.text = ""
            }
        }
    }

    @IBOutlet var lblHostelName: UILabel! {
        didSet {
            if model!.count != 0 {
                lblHostelName.text = model![0].Hostel_Name
            } else {
                lblHostelName.text = ""
            }
        }
    }

    @IBOutlet var lblRoomNumber: UILabel! {
        didSet {
            if model!.count != 0 {
                lblRoomNumber.text = String(model![0].Room_ID)
            } else {
                lblRoomNumber.text = ""
            }
        }
    }

    // MARK: - Functions

    func setUp() {
        let backButton = UIButton(type: .custom)
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(tappedBackButton), for: .allTouchEvents)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.title = "Profile"
    }

    @objc func tappedBackButton() {
        navigationController?.popToRootViewController(animated: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationItem.title = "Profile"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
