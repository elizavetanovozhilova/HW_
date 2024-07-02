//
//  ViewController.swift
//  HW2
//
//  Created by Елизавета Новожилова on 01.07.2024.
//

import UIKit

//let minion = UIImage(named: "00059000")
var users = [(username: "liza", password: "n", age: "19", fav: "horse"), (username: "minion", password: "bob", age: "230", fav: "bear")]

class FirstViewController: UIViewController {
    let usernames: String = "liza"
    let passwords: String = "n"

    
    @IBOutlet weak var instruction: UILabel!
    @IBOutlet weak var auth: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        signIn.backgroundColor = .darkGray
    }
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning()
    }
    
    @IBAction func button(_ sender: Any) {
            var isAuthenticated = false
            var userAge: String?
            var userFav: String?

            for user in users {
                if username.text == user.username && password.text == (user as AnyObject).password {
                    isAuthenticated = true
                    userAge = user.age
                    userFav = user.fav
                    break
                }
            }

            if isAuthenticated, let age = userAge, let fav = userFav {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let secondController = storyboard.instantiateViewController(withIdentifier: "second_controller") as! SecondViewController
                //auth.text = "loading"
                auth.textColor = .systemPink
                auth.textAlignment = .center
                secondController.loadViewIfNeeded()
                //secondController.view.backgroundColor = .systemGray
                secondController.setup(usernames: username.text!)
                secondController.data(ages: age, favs: fav)
                navigationController?.pushViewController(secondController, animated: true)
            } else {
                auth.text = "Wrong username or password"
                auth.textColor = .red
            }
        }
    }

