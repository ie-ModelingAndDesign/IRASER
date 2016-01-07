//
//  ViewController.swift
//  ui
//
//  Created by 山本　凌 on 2015/12/17.
//  Copyright © 2015年 山本　凌. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let m1 = NSBundle.mainBundle().pathForResource("m1", ofType: "jpg")
        let m2 = NSBundle.mainBundle().pathForResource("m2", ofType: "jpg")
        let m4 = NSBundle.mainBundle().pathForResource("m4", ofType: "jpg")
        let image_m1 = UIImage(contentsOfFile: m1!)
        let image_m2 = UIImage(contentsOfFile: m2!)
        let image_m4 = UIImage(contentsOfFile: m4!)
        let m1view = UIImageView(frame:  CGRect(x: self.view.frame.size.width - 115, y: 50, width: 80, height: 80))
        m1view.image = image_m1
        let m2view = UIImageView(frame:  CGRect(x: 20, y: 50, width: 80, height: 80))
        m2view.image = image_m2
        let m4view = UIImageView(frame:  CGRect(x: 0, y: self.view.frame.size.height - self.view.frame.size.width, width: self.view.frame.size.width, height: self.view.frame.size.width))
        m4view.image = image_m4
        self.view.addSubview(m1view)
        self.view.addSubview(m2view)
        self.view.addSubview(m4view)
        
        let rule1 = UILabel()
        let rule2 = UILabel()
        let rule3 = UILabel()
        
        rule1.frame = CGRectMake(0, 0, self.view.frame.size.width, 50)
        rule1.backgroundColor = UIColor.whiteColor()
        rule1.text = "「ぱなき」とはようするにしりとりです"
        rule1.textColor = UIColor.redColor()
        rule1.textAlignment = NSTextAlignment.Center
        rule1.layer.position = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 3)
        
        rule2.frame = CGRectMake(0, 0, self.view.frame.size.width, 50)
        rule2.backgroundColor = UIColor.whiteColor()
        rule2.text = "相手に「ぱなき」と言われたら終わりです"
        rule2.textColor = UIColor.orangeColor()
        rule2.textAlignment = NSTextAlignment.Center
        rule2.layer.position = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 3 + 50)
        
        rule3.frame = CGRectMake(0, 0, self.view.frame.size.width, 50)
        rule3.backgroundColor = UIColor.whiteColor()
        rule3.text = "しりとりの続いた回数がスコアです"
        rule3.textColor = UIColor.blueColor()
        rule3.textAlignment = NSTextAlignment.Center
        rule3.layer.position = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 3 + 100)
        
//        self.view.addSubview(rule1)
//        self.view.addSubview(rule2)
//        self.view.addSubview(rule3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

