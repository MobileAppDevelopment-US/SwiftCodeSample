//
//  SelectTenantCell.swift
//  SwiftCodeSample
//
//  Created by Serik on 3/26/19.
//  Copyright © 2019 Serik_Klement. All rights reserved.
//

import UIKit

class SelectTenantCell: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var boorderView: UIView!
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var tapBlueView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: Properties
    
    var handleSelect: VoidCompletion?
    
    var tenant: Tenant? {
        didSet {
            nameLabel.text = tenant?.name
        }
    }
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure()
        createTapGestureRecognizer()
    }
    
    // MARK: Action
    
    @objc private func cellTapped()
    {
        handleSelect?()
    }
    
    // MARK: Methods
    
    private func configure()
    {
        nameLabel.textColor = DesignModel.BlueColor
        
        boorderView.backgroundColor = DesignModel.BlueColor
        boorderView.layer.cornerRadius = DesignModel.CornerRadiusBoorderView
        boorderView.clipsToBounds = true
        
        whiteView.backgroundColor = DesignModel.WhiteColor
        whiteView.layer.cornerRadius = DesignModel.CornerRadiusView
        whiteView.clipsToBounds = true
        
        tapBlueView.backgroundColor = DesignModel.BlueColor
        tapBlueView.layer.cornerRadius = DesignModel.CornerRadiusTapBlueView
        tapBlueView.clipsToBounds = true
        
        tapBlueView.isHidden = true
    }
    
    private func createTapGestureRecognizer()
    {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        self.contentView.isUserInteractionEnabled = true
        self.contentView.addGestureRecognizer(tapGestureRecognizer)
    }
}

