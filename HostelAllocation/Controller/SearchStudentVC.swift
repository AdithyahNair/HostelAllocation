//
//  ViewController.swift
//  HostelAllocation
//
//  Created by Adithyah Nair on 02/12/22.
//

import UIKit

class SearchStudentVC: UIViewController {
    // MARK: - Properties

    var model = StudentModel()

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
            model.downloadStudentData(query: "Student_ID=\(studentID)")
        }
    }
}

extension SearchStudentVC: NetworkDelegate {
    func didReceiveData(data: Any) {
        DispatchQueue.main.async {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let secondVC = storyBoard.instantiateViewController(withIdentifier: "StudentDetails") as! StudentDetailsVC
            secondVC.model = data as? Student
            self.navigationController?.pushViewController(secondVC, animated: false)
        }
    }

    func didNotReceiveData(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }
}
