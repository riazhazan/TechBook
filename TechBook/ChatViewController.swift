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
    
    var m_arrMessageArray:NSMutableArray? = NSMutableArray()
    var messageData : MessagesDTO! = MessagesDTO(msgs: [])
    
    override func viewDidLoad() {
        
        self.initializeVariables()
        
        super.viewDidLoad()

        self.navigationItem.title = "Chat"

       
        self.setUpView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
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
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData!
    {
        return self.messageData.messages.objectAtIndex(indexPath.row) as! JSQMessageData
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource!
    {
        let message : JSQMessage = self.messageData.messages.objectAtIndex(indexPath.row) as! JSQMessage
        
        if (message.senderId == self.senderId)
        {
            return self.messageData.outgoingBubbleImageData;
        }
        
        return self.messageData.incomingBubbleImageData;
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageAvatarImageDataSource! {
        
        let message : JSQMessage = self.messageData.messages.objectAtIndex(indexPath.row) as! JSQMessage
        
        if (message.senderId == self.senderId)
        {
            return nil;
        }
        else {
            let avatarImageview : UIImageView = UIImageView()
            let avtImg : JSQMessagesAvatarImage = JSQMessagesAvatarImage(avatarImage: UIImage(named: "jessica-alba."), highlightedImage: UIImage(named: "jessica-alba."), placeholderImage: UIImage(named: "jessica-alba."))
            
//            avatarImageview.sd_setImageWithURL(self.selectedUserImage!, placeholderImage: PlaceHolderImageSquare, completed: { (image, error, cacheType, imageURL) -> Void in
//                avatarImageview.image = image
//            })
//            avtImg = JSQMessagesAvatarImage(avatarImage: avatarImageview.image, highlightedImage: PlaceHolderImageSquare, placeholderImage: PlaceHolderImageSquare)
            return avtImg
        }
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, attributedTextForCellTopLabelAtIndexPath indexPath: NSIndexPath!) -> NSAttributedString! {
        
        let message1 : JSQMessage = self.messageData.messages.objectAtIndex(indexPath.row) as! JSQMessage
        if(indexPath.row == 0){
            
            return JSQMessagesTimestampFormatter.sharedFormatter().attributedTimestampForDate(message1.date)
        }
        else{
            let message2 : JSQMessage = self.messageData.messages.objectAtIndex(indexPath.row - 1) as! JSQMessage
            let date1 = JSQMessagesTimestampFormatter.sharedFormatter().attributedTimestampForDate(message1.date)
            let date2 = JSQMessagesTimestampFormatter.sharedFormatter().attributedTimestampForDate(message2.date)
            if(date1 != date2){
                return JSQMessagesTimestampFormatter.sharedFormatter().attributedTimestampForDate(message1.date)
            }
        }

        return nil
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAtIndexPath indexPath: NSIndexPath!) -> NSAttributedString! {
        return NSAttributedString(string: "")
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, attributedTextForCellBottomLabelAtIndexPath indexPath: NSIndexPath!) -> NSAttributedString! {
        return nil
    }
    
    //MARK: - UICollectionView DataSource
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.messageData.messages.count ?? 0
    }
    
    
    //MARK: - JSQMessages collection view flow layout delegate
    
    //MARK: - Adjusting cell label heights
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForCellTopLabelAtIndexPath indexPath: NSIndexPath!) -> CGFloat
    {

        let message1 : JSQMessage = self.messageData.messages.objectAtIndex(indexPath.row) as! JSQMessage
        if(indexPath.row == 0){
            
            return kJSQMessagesCollectionViewCellLabelHeightDefault;
        }
        else{
            let message2 : JSQMessage = self.messageData.messages.objectAtIndex(indexPath.row - 1) as! JSQMessage
            let date1 = JSQMessagesTimestampFormatter.sharedFormatter().attributedTimestampForDate(message1.date)
            let date2 = JSQMessagesTimestampFormatter.sharedFormatter().attributedTimestampForDate(message2.date)
            if(date1 != date2){
                return kJSQMessagesCollectionViewCellLabelHeightDefault;
            }
        }
        return 0.0
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell:JSQMessagesCollectionViewCell = super.collectionView(collectionView, cellForItemAtIndexPath: indexPath) as! JSQMessagesCollectionViewCell
        let message : JSQMessage = self.messageData.messages.objectAtIndex(indexPath.row) as! JSQMessage
        if (message.senderId != self.senderId)
        {
            //cell.avatarImageView!.sd_setImageWithURL(self.selectedUserImage, placeholderImage: UIImage(named: "jessica-alba."))
            cell.avatarImageView?.image = UIImage(named: "jessica-alba.")
        }
        cell.textView!.textColor = UIColor.grayColor()
        return cell
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        
        let currentMessage : JSQMessage = self.messageData.messages.objectAtIndex(indexPath.row) as! JSQMessage
        if (currentMessage.senderId == self.senderId)
        {
            return 2
        }
        
        if (indexPath.row - 1 > 0)
        {
            let previousMessage : JSQMessage = self.messageData.messages.objectAtIndex(indexPath.row - 1) as! JSQMessage
            if (currentMessage.senderId == previousMessage.senderId)
            {
                return 2
            }
        }
        return kJSQMessagesCollectionViewCellLabelHeightDefault;
    }
    
    func createTempMessageArray()
    {
        for (var i = 0; i <= 10; i++)
        {
            let messageResponseDTO:MessageDetailsDTO? = MessageDetailsDTO()
            messageResponseDTO?.messageText = "This is a test text"
            messageResponseDTO?.isMessageSuccess = true
   
            messageResponseDTO?.messageSenderId = "123"
            
            if i%2 == 0
            {
                messageResponseDTO?.messageSenderId = self.senderId
            }

            messageResponseDTO?.messageSendDate = NSDate()
            messageResponseDTO?.messagSendeProfile_Image = ""
            messageResponseDTO?.messageSenderName = "Micheal"
            messageResponseDTO?.message_channelName = "TB123"
            self.m_arrMessageArray?.addObject(messageResponseDTO!)
        }
        self.arrangeMessageDataForDispaly()
    }

    func arrangeMessageDataForDispaly(){
        
        self.messageData = MessagesDTO(msgs: self.m_arrMessageArray!)
        self.collectionView!.reloadData()
        self.scrollToBottomAnimated(false)
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
