//
//  MessagesDTO.swift
//  TechBook
//
//  Created by Riaz Hassan on 10/12/15.
//  Copyright © 2015 Riaz Hassan. All rights reserved.
//

import UIKit

class MessagesDTO: NSObject {
    
    var bubbleFactory : JSQMessagesBubbleImageFactory!
    var outgoingBubbleImageData : JSQMessagesBubbleImage!
    var incomingBubbleImageData : JSQMessagesBubbleImage!
    
    var m_arrOriginalMessages : NSArray!
    var messages : NSMutableArray!
    
    var avatars : NSMutableDictionary!
    var messageDict:NSMutableDictionary!
    
    convenience init(msgs : NSArray)
    {
        self.init()
        bubbleFactory = JSQMessagesBubbleImageFactory()
        self.incomingBubbleImageData = bubbleFactory.incomingMessagesBubbleImageWithColor(UIColorIncomingMessage)
        self.outgoingBubbleImageData = bubbleFactory.outgoingMessagesBubbleImageWithColor(UIColorOutgoingMessage)
        self.loadMessages(msgs)
    }
    
    func loadMessages(msgs : NSArray)
    {
        if messages == nil
        {
            messages = NSMutableArray()
        }
        if avatars == nil
        {
            avatars = NSMutableDictionary()
        }
        
        for (var i = 0 ; i < msgs.count; i++)
        {
            if let message = msgs.objectAtIndex(i) as? MessageDetailsDTO{
                let newMessage  = msgs.objectAtIndex(i) as! MessageDetailsDTO
                messages?.addObject(self.getMessageObject(newMessage))
            }
            else{
                
            }
            
            //            var message : MessageDetailsDTO = msgs.objectAtIndex(i) as! MessageDetailsDTO
            
        }
    }
    func getMessageObject(message :MessageDetailsDTO) -> JSQMessage
    {
        print ("ID = \(message.messageSenderId) text = \(message.messageText)")
        
        let msg : JSQMessage = JSQMessage(senderId: message.messageSenderId ?? "", senderDisplayName: "", date: message.messageSendDate, text: message.messageText)
        //msg.profileImage = NSURL(fileURLWithPath: message.messagSendeProfile_Image!)
        return msg
    }
    
}

class MessageSenderDTO: NSObject {
    
    var  messageCount:Int?
    var  messageSenderDetailsArray:NSMutableArray? = NSMutableArray()
}

class MessageSenderInfoDTO:NSObject  {
    var multiChatchannel:String?
    var chatChannel:String?
    var fullName:String?
    var firstName:String?
    var lastName:String?
    var profileImage:NSURL?
    var userId:String?
    var isFacebook:Bool?
    var messageSendDate:NSDate?
    var lastMessage:String?
    var isUserSelectedForRemoval:Bool?
    var isUserHasUreadMessage:Bool?
    
    
}

class MessageDetailsDTO: NSObject {
    var messageSenderId:String?
    var messageId:String?
    var messageReceiverId:String?
    var isMessageSuccess:Bool?
    var messageSenderName:String?
    var messageReceiverName:String?
    var messageReceiverImage:String?
    var messageText:String?
    var messageReceivedText:String?
    var messageSendDate:NSDate?
    var isAreadMessage:Bool?
    var messageReceivedDate:NSDate?
    var messagSendeProfile_Image:String?
    var message_channelName:String?
}

class ChannelDetailsDTO: NSObject {
    var channelName:String?
    var messageId:String?
    var messageSenderId:String?
    var messageSenderName:String?
    var messageText:String?
    var messageSendDate:NSDate?
    var messagSendeProfile_Image:String?
    var isUserSelectedForRemoval:Bool?
    var isUserHasUreadMessage:Bool?
}


