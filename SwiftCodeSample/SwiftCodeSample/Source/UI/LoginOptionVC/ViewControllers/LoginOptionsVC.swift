//
//  LoginOptionsVC.swift
//  SwiftCodeSample
//
//  Created by Serik on 3/26/19.
//  Copyright © 2019 Serik_Klement. All rights reserved.
//

import UIKit

class LoginOptionsVC: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var topConstraintLogo: NSLayoutConstraint!
    @IBOutlet weak var selectButton: UIButton!
    
    // MARK: Properties
    
    var dataSource: TenantDataSourceProtocol!
    var handleSelect: VoidCompletion?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confugure()
        showAnimafionLogo()
        hideKeyboard()
        
        dataSource.addObserver(self)
        dataSource.getTenantsRequests()
    }
    
    deinit {
        DLog("LoginOptionsVC -- deinit")
    }
    
    // MARK: Actions
    
    @IBAction func ActionSelectButton(_ sender: UIButton) {
        handleSelect?()
    }
    
    // MARK: Methods
    
    private func confugure()
    {
        logoImage.image = UIImage(named: "Logo")
        selectButton.backgroundColor = DesignModel.WhiteColor
        selectButton.layer.cornerRadius = DesignModel.CornerRadius
        selectButton.setTitle("Select tenant", for: .normal)
        selectButton.setTitleColor(DesignModel.BlueColor, for: .normal)
        selectButton.clipsToBounds = true
        selectButton.isHidden = true
    }
    
    private func showAnimafionLogo()
    {
        UIView.animate(withDuration: DesignModel.WithDuration,
                       delay: DesignModel.WithDuration,
                       options: .curveEaseOut,
                       animations: {
                        self.topConstraintLogo.constant = DesignModel.TopConstraintLogo
                        self.view.layoutIfNeeded()
        },
                       completion: { (finished: Bool) in
                        self.selectButton.isHidden = !finished
        })
    }
}

// MARK: Hide Keyboard

extension LoginOptionsVC
{
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action:#selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

// MARK: ObserverPatternObservingProtocol

extension LoginOptionsVC: ObserverPatternObservingProtocol
{
    func dataSource(_ sender: Any, didUpdateWithError error: Error?, userInfo: Any?)
    {
        if let error = error {
            DLog("Error info: \(error.localizedDescription)")
        }
        DLog("DataSource updated")
    }
}
