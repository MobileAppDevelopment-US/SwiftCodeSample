//
//  SelectTenantView.swift
//  SwiftCodeSample
//
//  Created by Serik on 3/26/19.
//  Copyright © 2019 Serik_Klement. All rights reserved.
//

import UIKit

class SelectTenantView: UIView {
    
    // MARK: Outlets
    
    @IBOutlet weak var selectLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    
    var cells = [SelectTenantCell]()
    let identifier = "SelectTenantCell"
    var tenant: Tenant?
    var tenants: [Tenant]?
    
    var handleOkButtonTap: VoidCompletion?
    var onDissmis: VoidCompletion?
    
    // MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure()
        registerNibs()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: Actions
    
    @IBAction func actionCancelButton(_ sender: UIButton) {
        onDissmis?()
    }
    
    @IBAction func actionOkButton(_ sender: UIButton) {
        handleOkButtonTap?()
    }
    
    // MARK: Methods
    
    private func configure()
    {
        self.layer.cornerRadius = DesignModel.CornerRadiusView
        self.clipsToBounds = true
        
        selectLabel.text = "Select tenant"
        selectLabel.textColor = DesignModel.WhiteColor
        
        headerView.backgroundColor = DesignModel.BlueColor
        
        cancelButton.backgroundColor = DesignModel.WhiteColor
        cancelButton.layer.cornerRadius = DesignModel.CornerRadiusButton
        cancelButton.clipsToBounds = true
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(DesignModel.BlueColor, for: .normal)
        cancelButton.layer.borderWidth = DesignModel.BorderWidth
        cancelButton.layer.borderColor = DesignModel.BlueColor.cgColor
        
        okButton.backgroundColor = DesignModel.BlueColor
        okButton.layer.cornerRadius = DesignModel.CornerRadiusButton
        okButton.clipsToBounds = true
        okButton.setTitle("Ok", for: .normal)
        okButton.setTitleColor(DesignModel.WhiteColor, for: .normal)
    }
    
    private func registerNibs()
    {
        let nib = UINib(nibName: identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
}
