//
//  ViewController.swift
//  HostelAllocation
//
//  Created by Adithyah Nair on 02/12/22.
//

import UIKit

class SearchStudentVC: UIViewController {
    // MARK: - Properties

    let model = StudentModel()

    // MARK: - IBOutlets

    @IBOutlet var srmapLogo: UIImageView! {
        didSet {
            srmapLogo.image = UIImage(named: "srmap-logo")
        }
    }

    @IBOutlet var textField: UITextField! {
        didSet {
            textField.placeholder = "Enter Student ID"
            textField.layer.cornerRadius = 12
        }
    }

    @IBOutlet var btnViewDetails: UIButton! {
        didSet {
            btnViewDetails.titleLabel?.text = "View Details"
            btnViewDetails.backgroundColor = .systemBlue
            btnViewDetails.layer.masksToBounds = true
            btnViewDetails.layer.cornerRadius = 10
            btnViewDetails.setTitleColor(.white, for: .normal)
            btnViewDetails.addTarget(self, action: #selector(getStudentData), for: .allTouchEvents)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        model.delegate = self
        view.backgroundColor = .systemYellow
    }

    // MARK: - Functions

    @objc func getStudentData() {
        if let studentID = textField.text {
            let param = ["Student_ID": studentID]
            model.downloadStudentData(params: param, url: URLServices.url)
        }
    }
}

extension SearchStudentVC: NetworkDelegate {
    func didReceiveData(data: Any) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondViewController = storyboard.instantiateViewController(withIdentifier: "StudentDetails") as! StudentDetailsVC
            secondViewController.model = (data as! [Student])
            self.navigationController?.pushViewController(secondViewController, animated: false)
        }
    }
}
