//
//  ViewController.swift
//  FavoriteScale-Swift
//
//  Created by liangqi on 15/12/16.
//  Copyright © 2015年 dailyios. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad();
        
        let fav = FavoriteScaleView(frame: CGRectMake(0, 0, 80, 80));
        fav.center = self.view.center;
        
        self.view.addSubview(fav);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

