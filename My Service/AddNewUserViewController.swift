//
//  AddNewUserViewController.swift
//  My Service
//
//  Created by Student13 on 6/15/2560 BE.
//  Copyright © 2560 SNRU. All rights reserved.
//

import UIKit

class AddNewUserViewController: UIViewController {
    
    //Implicit
    var nameString: String? = nil
    var userString: String? = nil
    var passwordString: String? = nil
    
    
    
    
    
    
    
    
    @IBOutlet weak var alertLabel: UILabel!
    
    @IBOutlet weak var nameTextFileld: UITextField!
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        
        //Get Value From TextField
        nameString = nameTextFileld.text
        userString = userTextField.text
        passwordString = passwordTextField.text
        
        //Check Space
        let intName = nameString?.characters.count
        let intUser = userString?.characters.count
        let intPasseord = passwordString?.characters.count
        
        if ( intName == 0  ) || ( intUser == 0 ) || ( intPasseord == 0 ) {
            //Have Space
            print("Have Space")
            alertLabel.alpha = 1
        }else{
        
        print("No Space")
        alertLabel.alpha = 0
            let strMyURL = "http://androidthai.in.th/snru/addUserBenz.php?isAdd=true&Name=" + nameString! + "&User=" + userString! + "&Password=" + passwordString! + ""
            print("strMyURL ==> \(strMyURL)")
            uploadValueToServer(strURL: strMyURL)
        
        }
        
        
    }   //Save Button
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print("This AddNewUser")
        
    }   //Main Method
    
    
    func uploadValueToServer(strURL: String) -> Void {
        
        //Process  Connected Http
        let urlPHP = strURL
        //Change String to url String
        let myURL = URL(string: urlPHP)
        
        let reqrese = NSMutableURLRequest(url: myURL!)
        let task = URLSession.shared.dataTask(with: reqrese as URLRequest){
            data, response, error in
            
            if error != nil {
                print("Error")
            }   else{
                
                if let unwrappedData = data {
                    
                    let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    let strJSON = dataString as Any
                    print("strJSON ==> \(strJSON)")
                    
                }
                
            }
            
            
            
        }
        task.resume( )
        performSegue(withIdentifier: "BlachHome", sender: self)

        
    }   //uploadValue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goHome" {
            
            if let desination = segue.destination as? ViewController {
                desination.myString  = ( sender as? String )!
            }
            
        }   // if
    }   // prapare
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }   //didReceive
    

    
} //Main Class
