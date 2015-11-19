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
    
    let mytextbox: UITextField = UITextField()
    let button01 : UIButton = UIButton()
    let contentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
        
        // Do any additional setup after loading the view, typically from a nib.
        setContentView()
        //button生成
        setbutton01()
        //ここまで
        
        //textfield生成
        setmytextbox()
        
        let words = "いす"
        print(lets.siritori(words))
        
    }
    
    override func viewWillAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        let keyboardheight = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        adjustingHeight(self.view.frame.size.height - keyboardheight.size.height, notification: notification)
    }
    
    func keyboardWillHide(notification: NSNotification) {
        let keyboardheight = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        adjustingHeight(self.contentView.frame.size.height + keyboardheight.size.height, notification: notification)
    }
    
    func adjustingHeight(height: CGFloat, notification: NSNotification) {
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
        let keyboard = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            if keyboard.size.height > 0.0 {
                var frame = self.contentView.frame
                frame.size.height = height
                self.contentView.frame = frame
                self.setmytextbox()
                self.setbutton01()
            }
        })
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setContentView() {
        self.contentView.backgroundColor = UIColor.blueColor()
        let contentViewFrame = self.view.frame
        self.contentView.frame = contentViewFrame
        self.view.addSubview(self.contentView)
    }
    
    func setmytextbox () {
        mytextbox.frame = CGRectMake(0, self.contentView.frame.height - 60, self.contentView.frame.size.width - 75, 60)
        mytextbox.text = "text"
        mytextbox.borderStyle = UITextBorderStyle.RoundedRect
        self.contentView.addSubview(mytextbox)
    }
    
    func setbutton01() {
        button01.frame = CGRectMake(self.mytextbox.frame.size.width + 10, self.contentView.frame.height - 60, 60, 60)
        button01.backgroundColor = UIColor.whiteColor()
        button01.setTitle("✈", forState: UIControlState.Normal)
        button01.layer.cornerRadius = 10.0
        button01.layer.masksToBounds = true
        self.contentView.addSubview(button01)
    }
    
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        // view の 階層順
        setContentView()
        setmytextbox()
        setbutton01()
    }
}

