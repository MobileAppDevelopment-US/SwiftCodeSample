//
//  Design.swift
//  SwiftCodeSample
//
//  Created by Serik on 3/26/19.
//  Copyright © 2019 Serik_Klement. All rights reserved.
//

import UIKit

open class DesignModel
{
    public static let shared: DesignModel = DesignModel()
    
    // MARK: BorderWidth
    
    public static let BorderWidth: CGFloat = 1.0
    
    // MARK: CornerRadius
    
    public static let CornerRadius: CGFloat = 5.0
    public static let CornerRadiusTapBlueView: CGFloat = 7.0
    public static let CornerRadiusView: CGFloat = 10.0
    public static let CornerRadiusBoorderView: CGFloat = 11.0
    public static let CornerRadiusButton: CGFloat = 17.0
    
    // MARK: Height
    
    public static let LabelHeight: CGFloat = 34.0
    public static let HeightCell: CGFloat = 44.0
    public static let HeightView: CGFloat = 50.0
    
    public static var WhiteColor = UIColor.white
    public static var BlueColor: UIColor { return UIColor(red: 0.0,
                                                          green: 142.0 / 255.0,
                                                          blue: 182.0 / 255.0, alpha: 1) } // 008eb6
    
    // MARK: Spacing
    
    public static let SpacingViewX: CGFloat = 30.0
    public static let SpacingViewY: CGFloat = 130.0
    public static let SecondSpacingViewY: CGFloat = 200.0
    
    // MARK: Other
    
    public static let Zero: CGFloat = 0.0
    public static let WithDuration: Double = 0.5
    public static let TopConstraintLogo: CGFloat = 10.0
}
