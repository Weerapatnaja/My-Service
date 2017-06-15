//
//  ViewController.swift
//  My Service
//
//  Created by Student13 on 6/15/2560 BE.
//  Copyright © 2560 SNRU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Process  Connected Http
        let urlPHP = "http://swiftcodingthai.com"
        //Change String to url String
        let myURL = URL(string: urlPHP)
        
        let reqrese = NSMutableURLRequest(url: myURL!)
        let task = URLSession.shared.dataTask(with: reqrese as URLRequest){
            data, response, error in
        
            if error != nil {
                print("Error ==> \(error)")
            }   else{
            
                if let unwrappedData = data {
                
                    let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    let strJSON = dataString as Any
                    print("strJSON ==> \(strJSON)")
                    
                }
                
            }
        
            
            
        }
        task.resume( )
        
       
    } //Main Methond

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


} //Main Class

