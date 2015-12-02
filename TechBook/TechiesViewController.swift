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

class TechiesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Techies"
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

        
        return cell ?? UserCollectionCell()
    }
    
    
    func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
        let totalPadding : CGFloat = (NUMBER_OF_COLUMNS + 1) * PADDING
        let widthToHeigthRatio : CGFloat = 1
        let cellWidth = (self.view.bounds.size.width - totalPadding) / NUMBER_OF_COLUMNS
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