//
//  LogInView.swift
//  SwiftCodeSample
//
//  Created by Serik on 3/26/19.
//  Copyright © 2019 Serik_Klement. All rights reserved.
//

import UIKit

class LogInView: UIView {
    
    // MARK: Outlets
    
    @IBOutlet weak var stackView: UIStackView!
    
    // MARK: Properties
    
    var tenant: Tenant?
    var heightView: CGFloat = DesignModel.HeightView
    
    var onDissmis: VoidCompletion?
    var handleLogInTap: VoidCompletion?
    
    // MARK: Lifecycle
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        setLabelsInStackView()
        self.backgroundColor = .clear
        let width = UIScreen.main.bounds.size.width - DesignModel.SpacingViewX * 2
        self.frame = CGRect(x: DesignModel.SpacingViewX,
                            y: DesignModel.SecondSpacingViewY,
                            width: width,
                            height: heightView)
    }
}

// MARK: - Action

@objc extension LogInView
{
    func tenantNameButtonAction() {
        self.removeFromSuperview()
        onDissmis?()
    }
    
    func logInButtonAction() {
        handleLogInTap?()
    }
}

// MARK: - Methods

extension LogInView {
    
    private func setLabelsInStackView()
    {
        removeAllSubviewsFromStackView()
        
        if let tenantName = tenant?.name {
            let tenantNameButton = createButtonWithTitle(tenantName)
            tenantNameButton.addTarget(self, action: #selector(tenantNameButtonAction), for: .touchUpInside)
            stackView.addArrangedSubview(tenantNameButton)
            heightView += DesignModel.HeightView
        }
        
        if let tenant = tenant?.securityTypes {
            for value in tenant {
                if value == "password" {
                    let nameUserLabel = createTextFieldWithPlaceholder("User name")
                    let passwordLabel = createTextFieldWithPlaceholder("Password")
                    
                    stackView.addArrangedSubview(nameUserLabel)
                    stackView.addArrangedSubview(passwordLabel)
                    heightView += DesignModel.HeightView * 2
                }
            }
        }
        
        let logInButton = createButtonWithTitle("Log in")
        logInButton.addTarget(self, action: #selector(logInButtonAction), for: .touchUpInside)
        stackView.addArrangedSubview(logInButton)
        
        layoutIfNeeded()
    }
    
    private func createTextFieldWithPlaceholder(_ placeholder: String) -> UITextField
    {
        let textField = UITextField()
        textField.frame = CGRect(x: DesignModel.Zero,
                                 y: DesignModel.Zero,
                                 width: stackView.frame.size.width,
                                 height: DesignModel.LabelHeight)
        textField.backgroundColor = DesignModel.WhiteColor
        textField.layer.cornerRadius = DesignModel.CornerRadius
        textField.clipsToBounds = true
        textField.placeholder = placeholder
        
        return textField
    }
    
    private func createButtonWithTitle(_ title: String) -> UIButton
    {
        let button = UIButton()
        button.frame = CGRect(x: DesignModel.Zero,
                              y: DesignModel.Zero,
                              width: stackView.frame.size.width,
                              height: DesignModel.LabelHeight)
        button.backgroundColor = DesignModel.WhiteColor
        button.layer.cornerRadius = DesignModel.CornerRadius
        button.clipsToBounds = true
        button.setTitle(title, for: .normal)
        button.setTitleColor(DesignModel.BlueColor, for: .normal)
        
        return button
    }
    
    private func removeAllSubviewsFromStackView()
    {
        stackView.arrangedSubviews.forEach { [weak self] subview in
            self?.stackView.removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
    }
}
