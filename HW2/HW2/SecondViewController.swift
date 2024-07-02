//
//  SecondControllerViewController.swift
//  HW2
//
//  Created by Елизавета Новожилова on 02.07.2024.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var age_title: UILabel!
    @IBOutlet weak var age_value: UILabel!
    
    @IBOutlet weak var fav_title: UILabel!
    @IBOutlet weak var fav_value: UILabel!
    
    @IBOutlet private weak var Usernames: UILabel!
    @IBOutlet weak var cat: UIImageView!
    @IBOutlet weak var kitty: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func setup(usernames: String) {
        Usernames.text = usernames
    }
    func data(ages: String, favs: String) {
        age_value.text = ages
        fav_value.text = favs
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
