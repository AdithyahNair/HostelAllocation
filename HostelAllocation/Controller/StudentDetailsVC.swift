//
//  StudentDetailsVC.swift
//  HostelAllocation
//
//  Created by Adithyah Nair on 02/12/22.
//

import UIKit

class StudentDetailsVC: UIViewController, UINavigationControllerDelegate {
    // MARK: - Properties

    var model: [Student]?

    // MARK: - Functions

    func setUp() {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UINavigationBar.appearance().backIndicatorImage, for: .normal)
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(tappedBackButton), for: .allTouchEvents)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.title = "Profile"
    }
    
    @objc func tappedBackButton() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUp()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
