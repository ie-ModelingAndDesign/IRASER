//
//  ViewController.swift
//  panaki
//
//  Created by Kazuma from IRASER on 2015/11/05.
//  Copyright © 2015年 Kazuma. All rights reserved.


import UIKit
import JSQMessagesViewController

class ViewController: JSQMessagesViewController {
    
    let lets = Andrea_higa()  // Main method
    let word = Andrea_higa_word() // Use for adjustChar method
    let mytextbox = UITextField()
    let navigationbar = UINavigationBar()

    var messages: [JSQMessage]?
    var incomingBubble: JSQMessagesBubbleImage!
    var outgoingBubble: JSQMessagesBubbleImage!
    var incomingAvatar: JSQMessagesAvatarImage!
    var outgoingAvatar: JSQMessagesAvatarImage!
    var beforeText : JSQMessage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lbtn = UIButton(type: .InfoLight)
        lbtn.setTitle("？", forState: .Normal)
        
        lbtn.addTarget(self, action: "appearDiscription", forControlEvents: .TouchDown)
        self.inputToolbar!.contentView!.leftBarButtonItem = lbtn;
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
        self.incomingBubble = bubbleFactory.incomingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleLightGrayColor())
        self.outgoingBubble = bubbleFactory.outgoingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleGreenColor())
        
        //アバターの設定
        //self.incomingAvatar = JSQMessagesAvatarImageFactory.avatarImageWithImage(UIImage(named: "hinako")!, diameter: 64)
        //self.outgoingAvatar = JSQMessagesAvatarImageFactory.avatarImageWithImage(UIImage(named: "keita")!, diameter: 64)
        
        //メッセージデータの配列を初期化
        self.messages = [JSQMessage(senderId: senderId, displayName: senderDisplayName, text: "りんご")]
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false
        let backButtonItem = UIBarButtonItem(title: "説明", style: .Plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButtonItem
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
    
        if (text.characters.first == word.adjustChar((self.messages?.last?.text)!) && word.isExistword(text) && usedWordSearch(text) == false && word.isExistword(text)) {
            self.inputToolbar?.contentView?.textView?.placeHolder = ""
            self.messages?.append(playermesssage)
            self.finishReceivingMessageAnimated(true)
            self.receiveAutoMessage()
        } else {
            self.inputToolbar?.contentView?.textView?.placeHolder = "ちゃんとパナキしてよね！！"
        }
            
        
        //メッセジの送信処理を完了する(画面上にメッセージが表示される)
        
        
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
    
    func didFinishMessageTimer(sender: NSTimer) {
        let message = JSQMessage(senderId: "user2", displayName: "underscore", text: lets.siritori((self.messages?.last?.text)!))
        self.messages?.append(message)
        self.finishReceivingMessageAnimated(true)
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
    
    
    
}