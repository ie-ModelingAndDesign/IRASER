//
//  ViewController.swift
//  panaki
//
//  Created by Kazuma from IRASER on 2015/11/05.
//  Copyright © 2015年 Kazuma. All rights reserved.


import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource{

    let lets = Andrea_higa()  // Main method
    let word = Andrea_higa_word() // Use for adjustChar method
    
    let mytextbox = UITextField()
    let button01 = UIButton()
    let contentView = UIView()
    var tableView = UITableView()
    var items: [String] = []
    var score = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        mytextbox.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        button01.addTarget(self , action: "push:", forControlEvents: .TouchUpInside)
        setContentView() // contentview
        sethistorylist() // tablecell
        setmytextbox() // textbox
        setbutton01() // button
        
        
        let words = "しりとり"
        items.append("💻" + words)
    }
    
    override func viewWillAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func push(sender: UIButton){
        // mytextbox.resignFirstResponder()
        if self.mytextbox.text!.characters.first == word.adjustChar(items.last!) {
            items.append("😁" + self.mytextbox.text!)
            items.append("💻" + lets.siritori(self.mytextbox.text!))
            self.mytextbox.text = ""
            self.mytextbox.placeholder = "ここに文字を入力すると良いよ"
            tableViewScrollToBottom(true)
            self.tableView.reloadData()
            score = score + 1;
        } else {
            self.mytextbox.text = ""
            self.mytextbox.placeholder = "ちゃんとパナキしてよね！"
        }
    }
    
    
    // http://stackoverflow.com/questions/26244293/scrolltorowatindexpath-with-uitableview-does-not-work
    func tableViewScrollToBottom(animated: Bool) {
        let delay = 0.1 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            let numberOfSections = self.tableView.numberOfSections
            let numberOfRows = self.tableView.numberOfRowsInSection(numberOfSections-1)
            
            if numberOfRows > 0 {
                let indexPath = NSIndexPath(forRow: numberOfRows-1, inSection: (numberOfSections-1))
                self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: animated)
            }
        })
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
                self.sethistorylist()
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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    func setContentView() {
        self.contentView.backgroundColor = UIColor.blueColor()
        let contentViewFrame = self.view.frame
        self.contentView.frame = contentViewFrame
        self.view.addSubview(self.contentView)
    }
    
    func setmytextbox() {
        mytextbox.frame = CGRectMake(0, self.contentView.frame.height - 60, self.contentView.frame.size.width - 75, 60)
        mytextbox.placeholder = "ここに文字を入力すると良いよ"
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
    
    func sethistorylist() {
        let btnh: CGFloat = 60
        let sbh = UIApplication.sharedApplication().statusBarFrame.size.height
        tableView.frame = CGRectMake(0, sbh, contentView.frame.size.width, contentView.frame.size.height - sbh - btnh)
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.contentView.addSubview(tableView)
        self.tableView.estimatedRowHeight = 20.0
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel!.text = self.items[indexPath.row]
        cell.textLabel!.lineBreakMode = .ByCharWrapping
        return cell
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        mytextbox.text = textField.text
        textField.resignFirstResponder() // キーボードを閉じる
        return true
    }
    
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        // view の 階層順
        setContentView()
        sethistorylist()
        setmytextbox()
        setbutton01()
    }
}

