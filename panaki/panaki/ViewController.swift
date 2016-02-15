//
//  ViewController.swift
//  panaki
//
//  Created by Kazuma from IRASER on 2015/11/05.
//  Copyright © 2015年 Kazuma. All rights reserved.


import UIKit
import JSQMessagesViewController
import AVFoundation

class ViewController: JSQMessagesViewController, AVAudioPlayerDelegate{
    
    let lets = Andrea_higa()  // Main method
    let word = Andrea_higa_word() // Use for adjustChar method
    let mytextbox = UITextField()
    let navigationbar = UINavigationBar()
    var talker = AVSpeechSynthesizer()
    let initMessage = "りんご"
    let player = try! AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("song", ofType: "caf")!))

    var messages: [JSQMessage]?
    var incomingBubble: JSQMessagesBubbleImage!
    var outgoingBubble: JSQMessagesBubbleImage!
    var incomingAvatar: JSQMessagesAvatarImage!
    var outgoingAvatar: JSQMessagesAvatarImage!
    var beforeText : JSQMessage!
    var alpha: CGFloat = 1.0
    var style = UIStatusBarStyle.LightContent
    var flag = true

    override func viewDidLoad() {
        super.viewDidLoad()
            
        player.delegate = self
        
        player.prepareToPlay()
        
        player.numberOfLoops = 9223372036854775807
            

        self.setNeedsStatusBarAppearanceUpdate()
        
        let bg = NSBundle.mainBundle().pathForResource("bg", ofType: "png")
        let image_bg = UIImage(contentsOfFile: bg!)
        let w = UIScreen.mainScreen().bounds.size.width
        let h = w * 555 / 476
        
        let bgview = UIImageView(frame:  CGRect(x: 0, y: 30, width: w, height: h))
        bgview.image = image_bg
        self.collectionView?.backgroundColor = UIColor.blackColor()
        self.view.insertSubview(bgview, atIndex: 0)
        
        let lbtn = UIButton(type: .InfoLight)
        lbtn.setTitle("？", forState: .Normal)
        
        lbtn.addTarget(self, action: "appearDiscription", forControlEvents: .TouchDown)
        self.inputToolbar!.contentView!.leftBarButtonItem = lbtn
        self.inputToolbar?.contentView?.textView?.placeHolder = ""
        //自分のsenderId, senderDisokayNameを設定
        self.senderId = "user1"
        self.senderDisplayName = "hoge"
        let rightButton = UIButton(frame: CGRectZero)
        let sendImage = UIImage(named: "sendbutton.png")
        rightButton.setImage(sendImage, forState: UIControlState.Normal)
        
        self.inputToolbar!.contentView!.rightBarButtonItemWidth = CGFloat(34.0)
        self.inputToolbar!.contentView!.rightBarButtonItem = rightButton
    
        
        //吹き出しの設定
        let bubbleFactory = JSQMessagesBubbleImageFactory()
        self.incomingBubble = bubbleFactory.incomingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleRedColor())
        self.outgoingBubble = bubbleFactory.outgoingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleBlueColor())
        
        //アバターの設定
        
        let cpu = NSBundle.mainBundle().pathForResource("panaki", ofType: "png")
        self.incomingAvatar = JSQMessagesAvatarImageFactory.avatarImageWithImage(UIImage(contentsOfFile: cpu!), diameter: 64)
        let me = NSBundle.mainBundle().pathForResource("me", ofType: "png")
        self.outgoingAvatar = JSQMessagesAvatarImageFactory.avatarImageWithImage(UIImage(contentsOfFile: me!), diameter: 64)
        
        //メッセージデータの配列を初期化
        self.messages = [JSQMessage(senderId: "user2", displayName: senderDisplayName, text: initMessage)]
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.inputToolbar?.contentView?.textView?.becomeFirstResponder() // focus
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Sendボタンが押された時に呼ばれる
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
        
        print(self.inputToolbar?.contentView?.textView?.text)
        //新しいメッセージデータを追加する
        let playermesssage = JSQMessage(senderId: senderId, displayName: senderDisplayName, text: text)
    
        if (text.characters.first == word.adjustChar((self.messages?.last?.text)!)
            && word.isExistword(text)
            && usedWordSearch(text) == false) {
            self.inputToolbar?.contentView?.textView?.placeHolder = ""
            self.messages?.append(playermesssage)
            self.finishReceivingMessageAnimated(true)
            self.receiveAutoMessage()

            alpha -= (alpha > 0.01) ? 0.005 : 0
            
            self.collectionView?.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(alpha)
        } else {
            self.inputToolbar?.contentView?.textView?.placeHolder = "ちゃんとパナキしてよね！！"
        }
        
        //擬似的に自動でメッセージを受信
        self.finishSendingMessageAnimated(true)
    
    }
    
    //アイテムごとに参照するメッセージデータを返す
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
        return self.messages?[indexPath.item]
    }
    
    //アイテムごとのMessageBubble(背景)を返す
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource! {
        let message = self.messages?[indexPath.item]
        if message?.senderId == self.senderId {
            return self.outgoingBubble
        }
        return self.incomingBubble
    }
    
    //アイテムごとにアバター画像を返す
    override func collectionView(collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageAvatarImageDataSource! {
        let message = self.messages?[indexPath.item]
        if message?.senderId == self.senderId {
            return self.outgoingAvatar
        }
        return self.incomingAvatar
    }
    
    //アイテムの総数を返す
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.messages?.count)!
    }
    
    //返信メッセージを受信する
    func receiveAutoMessage() {
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "didFinishMessageTimer:", userInfo: nil, repeats: false)
    }
    
    func presentScoreView(score: Int) {
        let sv = scoreview()
        sv.setScore(score)
        sv.modalPresentationStyle = .Popover
        presentViewController(sv, animated: true, completion: nil)
    }
    
    func didFinishMessageTimer(sender: NSTimer) {
        
        while(true){
            let message = JSQMessage(senderId: "user2", displayName: "underscore", text: lets.siritori((self.messages?.last?.text)!))
            if (usedWordSearch(message.text!) == false && message.text!.characters.last != "ぱ"){
                self.messages?.append(message)
                //テキスト読み上げ
                if (message.text! != "パナキ"){
                    let utterance = AVSpeechUtterance(string: (self.messages?.last?.text)!)
                    utterance.rate = AVSpeechUtteranceDefaultSpeechRate  //読み上げ速度
                    utterance.pitchMultiplier = 1.0  //声の高さ
                    utterance.volume = 1.0   //ボリューム
                    utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")  //言語設定
                    self.talker.speakUtterance(utterance)   //読み上げ実行
                }
                self.finishReceivingMessageAnimated(true)
                break
            }
        }
        
        if (self.messages?.last?.text)! == "パナキ" {
            NSLog("パナキ")
            let delay = 0.8 * Double(NSEC_PER_SEC)
            let panaki = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("panaki", ofType: "aiff")!)
            //パナキです！ を再生
            var sound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(panaki, &sound)
            AudioServicesPlaySystemSound(sound)
            
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue(), {
                self.presentScoreView((self.messages?.count)! / 2)
            })
        } else if ((self.messages?.count)! / 2 % 20 == 0 && (self.messages?.count)! / 2 > 200) {
            
            if flag {
                player.play()
                flag = false
            }
            let delay = 0.8 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue(), {
                self.Do_you_admit_defeat()
            })
        }
    }
    
    func Do_you_admit_defeat() {
        let alert = UIAlertController(title: "ここまでよく頑張りました!!", message:"長くなりそうですね。\n負けを認めますか?", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "はい", style: .Default) { _ in
            self.player.stop()
            self.presentScoreView((self.messages?.count)! / 2)
        })
        alert.addAction(UIAlertAction(title: "いいえ", style: .Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func usedWordSearch(word: String) -> Bool {
        var usedflag = false
        for hikaku in self.messages!{
            print(hikaku.text)
            if (hikaku.text == word){
                usedflag = true
                break
            }
        }
        return usedflag
        
    }
    
    func appearDiscription() {
        let dc = DiscriptionView()
        dc.modalPresentationStyle = .Popover
        presentViewController(dc, animated: true, completion: nil)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false;
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
}