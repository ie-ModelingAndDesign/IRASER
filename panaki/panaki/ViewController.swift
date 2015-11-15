//
//  ViewController.swift
//  panaki
//
//  Created by Kazuma from IRASER on 2015/11/05.
//  Copyright © 2015年 Kazuma. All rights reserved.
//
// iphone size ... 6

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UIScrollViewDelegate{

    let lets = Andrea_higa()  // Main method
    
    let mytextbox: UITextField = UITextField(frame: CGRectMake(0,0,300,60))
    let button01 : UIButton = UIButton(frame: CGRectMake(0,0,60,60))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view, typically from a nib.
        
        //button生成
        button01.backgroundColor = UIColor.whiteColor()
        button01.setTitle("✈", forState: UIControlState.Normal)
        button01.layer.cornerRadius = 10.0
        button01.layer.masksToBounds = true
        button01.layer.position = CGPoint(x: self.view.frame.width/2+150, y:self.view.frame.height-35)
        self.view.addSubview(button01)
        //ここまで
        
        //textfield生成
        mytextbox.text = "text"
        mytextbox.borderStyle = UITextBorderStyle.RoundedRect
        mytextbox.layer.position = CGPoint(x:self.view.bounds.width/2-30,y:self.view.bounds.height-35);
        self.view.addSubview(mytextbox)
        
        let words = "いす"
        print(lets.siritori(words))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

