//
//  ProfileViewController.swift
//  TechBook
//
//  Created by Riaz Hassan on 02/12/15.
//  Copyright © 2015 Riaz Hassan. All rights reserved.
//

import UIKit

class ProfileViewController: TBBaseViewController {

    var placeHolderArray :NSMutableArray = NSMutableArray()
    var valueArray :NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Profile"
        self.view.backgroundColor = UIColor(netHex:0x42454A)
        self.initializeVariables()
    }
    
    func initializeVariables()
    {
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1;
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1;
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        
        if indexPath.row == 0
        {
            return 500
        }
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0
        {
            let cell:ProfileHeaderTableCell = tableView.dequeueReusableCellWithIdentifier("ProfileHeaderTableCell") as! ProfileHeaderTableCell
            cell.clipsToBounds = true
            cell.profileImgView?.layer.cornerRadius = 60
            cell.profileImgView?.backgroundColor = UIColor.cyanColor()
            cell.profileImgView?.layer.masksToBounds = true
            cell.nameLbl.text = "Nickolas Benlad"
            cell.mailBgiew.layer.borderColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5).CGColor
            cell.mailBgiew.layer.borderWidth = 1.0
            cell.phoneBGView.layer.borderColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5).CGColor
            cell.phoneBGView.layer.borderWidth = 1.0
            return cell
            
        }
//        else
//        {
//            let cell:ProfileTableCell = tableView.dequeueReusableCellWithIdentifier("ProfileTableCell") as! ProfileTableCell
//            cell.clipsToBounds = true
//            cell.backgroundColor = UIColor.clearColor();
//            cell.titlLbl.text = placeHolderArray[indexPath.row] as? String
//            cell.valueLbl.text = valueArray[indexPath.row] as? String
//            //cell.bgImageView.layer.borderColor = UIColor.lightGrayColor().CGColor
//            //cell.bgImageView.layer.borderWidth = 1.0
//            cell.bgImageView.backgroundColor = UIColor.clearColor()
//            return cell
//
//        }

        return UITableViewCell()
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
        return 0
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 0;
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
