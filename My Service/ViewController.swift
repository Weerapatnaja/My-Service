//
//  ViewController.swift
//  My Service
//
//  Created by Student13 on 6/15/2560 BE.
//  Copyright © 2560 SNRU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Explicit
    var myString = " "
    var strUser: String? = nil
    var strPassword: String? = nil
    
    
    
    
    
    
    @IBOutlet weak var userTextfield: UITextField!
    
    @IBOutlet weak var passwordTexrfield: UITextField!
    
    @IBOutlet weak var alertLabel: UILabel!
    
    @IBAction func loginButton(_ sender: Any) {
        
       
        
        //Gat value From TextField
        strUser = userTextfield.text
        strPassword = passwordTexrfield.text
        
        //Check Space
        if (strUser?.characters.count == 0) || (strPassword?.characters.count == 0) {
            alertLabel.alpha = 1
        }else{
        
            alertLabel.alpha = 0
            let strUrl = "http://androidthai.in.th/snru/getUserWhereBenz.php?isAdd=true&Name=benz&User=" + strUser! + ""
            print("strUrl ==> \(strUrl)")
            readJson(strURL: strUrl)
            
        }   // if
        
        
    }   //LoginButton
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
    } //Main Methond
    
    func readJson(strURL: String) -> Void {
        
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
                            
//                            if dataString != nil {
//                            
//                                print("dataString not nil")
//                            } else{
//                            
//                                print("dataString nil")
//                            }
                            
                            
                            
                            
                            
                           let strKey = ","
                            if let myContentArray = dataString?.components (separatedBy: strKey) {
                        
                                print("myContentArray[2] ==> \(myContentArray[2])")
                                print("myContentArray[3] ==> \(myContentArray[3])")
                                
                                //Check Password
                                let myPassword = "\"Password\":\"" + self.strPassword! + "\"}]"
                                if myPassword == myContentArray[3] {
                                    //Password True
                                    print("Password True")
                             //       performSegue(withIdentifier: "GoToMap", sender: self)

                                }   else {
                                    //Password False
                                    print("Password False")
                                }
                                
                            }   // if
                           
                            
        
                        }
                        
                    }   // if1
                
                    
                    
                }
                task.resume( )

        
        
    }   //readJson
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


} //Main Class

