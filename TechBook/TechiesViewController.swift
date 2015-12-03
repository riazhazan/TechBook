//
//  TechiesViewController.swift
//  TechBook
//
//  Created by Riaz Hassan on 02/12/15.
//  Copyright © 2015 Riaz Hassan. All rights reserved.
//

import UIKit

let NUMBER_OF_COLUMNS = CGFloat(2)
let PADDING = CGFloat(2)

class TechiesViewController: TBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationItem.title = "Techies"
        self.initializeVariables()
    }
    
    func initializeVariables()
    {
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section:Int)->Int
    {
        
        return 10
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath:NSIndexPath)->UICollectionViewCell
    {
        
        let  cell = collectionView.dequeueReusableCellWithReuseIdentifier("UserCollectionCell", forIndexPath: indexPath) as! UserCollectionCell

        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.whiteColor().CGColor
        cell.layer.cornerRadius = 3
        
        return cell ?? UserCollectionCell()
    }
    
    
    func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
        let totalPadding : CGFloat = (NUMBER_OF_COLUMNS + 1) * PADDING
        let widthToHeigthRatio : CGFloat = 1
        let cellWidth = (self.view.bounds.size.width - 20 - totalPadding) / NUMBER_OF_COLUMNS
        let cellHeight = cellWidth * widthToHeigthRatio
        return CGSizeMake(cellWidth, cellHeight)
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        
    }
    
    
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: PADDING, bottom: 55, right: PADDING)
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
    }

    
}