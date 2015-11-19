//
//  ViewController.swift
//  panaki
//
//  Created by Kazuma from IRASER on 2015/11/05.
//  Copyright © 2015年 Kazuma. All rights reserved.
//
// iphone size ...

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UIScrollViewDelegate{

    let lets = Andrea_higa()  // Main method
    //変数の定義
    let mytextbox = UITextField(frame: CGRectMake(0,0,300,60))
    let send_button = UIButton(frame: CGRectMake(0,0,60,60))
    let hoem_button = UIButton(frame: CGRectMake(0,0,50,50))
    let dic_button = UIButton(frame: CGRectMake(0,0,50,50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view, typically from a nib.
        
        //ホームボタンの生成
        
        
        //送信button生成
        send_button.backgroundColor = UIColor.whiteColor()
        send_button.setTitle("✈", forState: UIControlState.Normal)
        send_button.layer.cornerRadius = 10.0
        send_button.layer.masksToBounds = true
        send_button.layer.position = CGPoint(x: self.view.frame.width/2+150, y:self.view.frame.height-35)
        self.view.addSubview(send_button)
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

