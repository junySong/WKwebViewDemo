//
//  ViewController.swift
//  WKwebViewDemo
//
//  Created by 宋俊红 on 2017/12/1.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBtnClick(_ sender: UIButton) {
        let vc:WKwebViewController = WKwebViewController()
        self.present(vc, animated: true) {
            
        }
        
    }
    
}

