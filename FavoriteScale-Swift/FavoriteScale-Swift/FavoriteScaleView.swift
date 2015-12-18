//
//  FavoriteScaleView.swift
//  FavoriteScale-Swift
//
//  Created by liangqi on 15/12/17.
//  Copyright © 2015年 dailyios. All rights reserved.
//

import UIKit

class FavoriteScaleView: UIView {
    
    let imgSelect = UIImageView(image: UIImage(named: "header-icon-selected"));
    let imgUnselect = UIImageView(image: UIImage(named: "header-icon-unselected"));
    
    // 当前选中状态
    var selected = true {
        didSet {
            if selected {
                self.tag = 0;
                self.imgUnselect.transform = CGAffineTransformMakeScale(0, 0);
                self.imgSelect.transform = CGAffineTransformMakeScale(1, 1);
            } else {
                self.tag = 1;
                self.imgSelect.transform = CGAffineTransformMakeScale(0, 0);
                self.imgUnselect.transform = CGAffineTransformMakeScale(1, 1);
            }
        }
    }
    
    init(frame:CGRect, selected:Bool = true){
        self.selected = selected;
        super.init(frame: frame);
        self.setup();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup(){
        imgSelect.frame = self.bounds;
        imgUnselect.frame = self.bounds;
    
        addSubview(imgSelect);
        addSubview(imgUnselect);
        
        let defaultTrans =  CGAffineTransformMakeScale(0, 0);
        if selected {
            imgUnselect.transform = defaultTrans;
            self.tag = 0;
        } else {
            imgSelect.transform = defaultTrans;
            self.tag = 1;
        }
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        toggle();
    }
    
    private func toggle(){
        if self.tag == 0 {
            self.tag = 1;
            self.imgUnselect.transform = CGAffineTransformMakeScale(0, 0);
            UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.imgUnselect.transform = CGAffineTransformMakeScale(1, 1);
                }, completion: nil);
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.imgSelect.transform = CGAffineTransformMakeScale(0, 0);
            });
            
        }else{
            self.tag = 0;
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
               self.imgUnselect.transform = CGAffineTransformMakeScale(0, 0);
            });
            
            self.imgSelect.transform = CGAffineTransformMakeScale(0, 0);
            UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.imgSelect.transform = CGAffineTransformMakeScale(1, 1);
                }, completion: nil);
        }
    }
    
}
