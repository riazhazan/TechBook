//
//  ViewController.swift
//  TechBook
//
//  Created by Riaz Hassan on 01/12/15.
//  Copyright © 2015 Riaz Hassan. All rights reserved.
//

import UIKit

class ViewController: TBBaseViewController {

    @IBOutlet var signUpTable: UITableView!

    var placeHolderArray :NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        self.setUpNavigationItems()
        self.initializeVariables()
    }

    func setUpNavigationItems()
    {
        self.navigationItem.setRightBarButtonItem(UIBarButtonItem(title: "Join", style: UIBarButtonItemStyle.Done, target: self, action: "registerButtonAction:"), animated: true)
    }
    func initializeVariables()
    {
        placeHolderArray = ["First Name", "Last Name", "Date Of Birth", "Mobile Number","Company", "Country", "Email","About You"]
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
        
        return placeHolderArray.count;
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 50
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell:SigunUpTableCell = tableView.dequeueReusableCellWithIdentifier("SigunUpTableCell") as! SigunUpTableCell
        cell.clipsToBounds = true
        cell.backgroundColor = UIColor.clearColor();
        cell.textFld.tag = indexPath.row
        cell.textFld.placeholder = placeHolderArray[indexPath.row] as? String
        cell.textFld.layer.borderWidth = 0.5
        cell.textFld.layer.borderColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5).CGColor
        cell.textFld.attributedPlaceholder = NSAttributedString(string:(placeHolderArray[indexPath.row] as? String)!,
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor().colorWithAlphaComponent(0.2)])
        cell.textFld.placeholderRectForBounds(CGRectMake(10, 0, cell.textFld.bounds.width, cell.textFld.bounds.height))
        GeneralUtitlity.setPaddingtoTextField(cell.textFld)
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerCell = UIView(frame: CGRectMake(0,0, tableView.frame.size.width, 120));
        
        headerCell.backgroundColor = UIColor.clearColor()
        
        
        let headerButton = UIButton(frame: CGRectMake(tableView.frame.size.width/2 - 45, 15, 90, 90));
        headerButton.backgroundColor = UIColor.clearColor()
        //headerButton.setTitle("+", forState: .Normal)
        headerButton.tag = section
        headerButton.layer.cornerRadius = 45
        headerButton.layer.borderWidth = 1
        headerButton.layer.borderColor = UIColor.whiteColor().CGColor
        headerButton.setImage(UIImage(named: "cam"), forState: .Normal)
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
        return 0;
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

