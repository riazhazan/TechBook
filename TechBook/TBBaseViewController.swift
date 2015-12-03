//
//  TBBaseViewController.swift
//  TechBook
//
//  Created by Riaz Hassan on 03/12/15.
//  Copyright © 2015 Riaz Hassan. All rights reserved.
//

import UIKit

class TBBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(netHex:0x42454A)
        self.setNeedsStatusBarAppearanceUpdate()
        self.navigationController!.navigationBar.barStyle = UIBarStyle.Black;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
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
