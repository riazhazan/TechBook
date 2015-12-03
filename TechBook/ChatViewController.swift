//
//  ChatViewController.swift
//  TechBook
//
//  Created by Riaz Hassan on 02/12/15.
//  Copyright © 2015 Riaz Hassan. All rights reserved.
//

import UIKit

class ChatViewController: JSQMessagesViewController {

    var bubbleFactory : JSQMessagesBubbleImageFactory! = JSQMessagesBubbleImageFactory()
    var outgoingBubbleImageData : JSQMessagesBubbleImage!
    var incomingBubbleImageData : JSQMessagesBubbleImage!
    
    override func viewDidLoad() {
        
        self.initializeVariables()
        
        super.viewDidLoad()

        self.navigationItem.title = "Chat"
       
        self.setUpView()
    }
    
    func initializeVariables()
    {
        self.senderId = "12345"
        self.senderDisplayName = "Riaz Hassan"
    }
    
    func setUpView()
    {
        self.collectionView?.backgroundColor =  UIColor(netHex:0x42454A)
        incomingBubbleImageData = bubbleFactory.incomingMessagesBubbleImageWithColor(UIColorIncomingMessage)
        outgoingBubbleImageData = bubbleFactory.outgoingMessagesBubbleImageWithColor(UIColorOutgoingMessage)
        
        if #available(iOS 8.2, *)
        {
            self.collectionView!.collectionViewLayout.messageBubbleFont = UIFont.systemFontOfSize(15, weight: UIFontWeightRegular)
            self.inputToolbar!.contentView!.textView!.font =  UIFont.systemFontOfSize(15, weight: UIFontWeightRegular)
        }
        else {
            self.collectionView!.collectionViewLayout.messageBubbleFont = UIFont.systemFontOfSize(15)
            self.inputToolbar!.contentView!.textView!.font =  UIFont.systemFontOfSize(15)
        }
        
        self.inputToolbar!.contentView!.rightBarButtonItem!.setTitle("send", forState: UIControlState.Normal)
        self.showLoadEarlierMessagesHeader = false
        
        self.collectionView!.collectionViewLayout.outgoingAvatarViewSize = CGSizeZero
        self.collectionView!.collectionViewLayout.incomingAvatarViewSize = CGSizeMake(38, 38)
        let inComing=UINib(nibName: "JSQMessagesCollectionViewCellIncoming", bundle:nil)
        collectionView!.registerNib(inComing, forCellWithReuseIdentifier: "JSQMessagesCollectionViewCellIncoming")
        
        let outGoing=UINib(nibName: "JSQMessagesCollectionViewCellOutgoing", bundle:nil)
        collectionView!.registerNib(outGoing, forCellWithReuseIdentifier: "JSQMessagesCollectionViewCellOutgoing")
        self.inputToolbar!.contentView!.rightBarButtonItem!.titleLabel?.textColor = UIColor.redColor()
    }
    
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
        // Do Nothing
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
