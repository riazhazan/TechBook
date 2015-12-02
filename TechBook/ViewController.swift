//
//  ViewController.swift
//  TechBook
//
//  Created by Riaz Hassan on 01/12/15.
//  Copyright © 2015 Riaz Hassan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var signUpTable: UITableView!

    var placeHolderArray :NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        self.initializeVariables()
    }

    func initializeVariables()
    {
        placeHolderArray = ["First Name", "Last Name", "DOB", "Mobile Number", "Country", "Email (Optional)"]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1;
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6;
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 45
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell:SigunUpTableCell = tableView.dequeueReusableCellWithIdentifier("SigunUpTableCell") as! SigunUpTableCell
        cell.clipsToBounds = true
        cell.backgroundColor = UIColor.clearColor();
        cell.textFld.tag = indexPath.row
        cell.textFld.placeholder = placeHolderArray[indexPath.row] as? String
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerCell = UIView(frame: CGRectMake(0,0, tableView.frame.size.width, 120));
        
        headerCell.backgroundColor = UIColor.clearColor()
        
        
        let headerButton = UIButton(frame: CGRectMake(tableView.frame.size.width/2 - 45, 15, 90, 90));
        headerButton.backgroundColor = UIColor.greenColor()
        headerButton.setTitle("Register", forState: .Normal)
        headerButton.tag = section
        headerButton.layer.cornerRadius = 45
        headerButton.addTarget(self, action: "headerClicked:", forControlEvents: .TouchUpInside)
        
        headerCell.addSubview(headerButton)
        
        return headerCell
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 120
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 70;
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let headerCell = UIView(frame: CGRectMake(0,0, tableView.frame.size.width, 70));
        
        headerCell.backgroundColor = UIColor.clearColor()
        
        
        let headerButton = UIButton(frame: CGRectMake(40, 15, tableView.frame.size.width-80, 40));
        headerButton.backgroundColor = UIColor.greenColor()
        headerButton.setTitle("Register", forState: .Normal)
        headerButton.tag = section
        headerButton.layer.cornerRadius = 5
        headerButton.addTarget(self, action: "registerButtonAction:", forControlEvents: .TouchUpInside)
        
        headerCell.addSubview(headerButton)
        
        return headerCell
    }

    
    
    func headerClicked(sender:UIButton)
    {
 
//            let sections = NSIndexSet(index: previousClickedHeader)
//            
//            self.favouritesTableView.reloadSections(sections, withRowAnimation: .Fade)
      
        
    }

    func registerButtonAction(sender:UIButton)
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        GeneralUtitlity.setValueInUserDefaults(LOGGEDIN_TAG, value: true)
        appDelegate.navigateToHomePage()
        
    }
    
}

