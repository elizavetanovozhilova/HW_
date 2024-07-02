//
//  SecondControllerViewController.swift
//  HW2
//
//  Created by Елизавета Новожилова on 02.07.2024.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet private weak var Usernames: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func setup(usernames: String) {
        Usernames.text = usernames
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
