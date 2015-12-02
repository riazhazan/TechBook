//
//  GeneralUtitlity.swift
//  TechBook
//
//  Created by Riaz Hassan on 02/12/15.
//  Copyright © 2015 Riaz Hassan. All rights reserved.
//

import UIKit

class GeneralUtitlity: NSObject {

    class func setValueInUserDefaults(key:String,value:AnyObject?) {
        NSUserDefaults.standardUserDefaults().setObject(value, forKey: key)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    class func getValueFromUserDefaults(key:String)->AnyObject?{
        let storedVal:AnyObject?  = NSUserDefaults.standardUserDefaults().valueForKey(key)
        return storedVal
    }
}
