//
//  Router.swift
//  SwiftCodeSample
//
//  Created by Serik on 3/26/19.
//  Copyright © 2019 Serik_Klement. All rights reserved.
//

import UIKit

class Router: RouterProtocol
{
    let navigationAssembly: NavigationAssemblyProtocol
    
    init(navigationAssembly: NavigationAssemblyProtocol)
    {
        self.navigationAssembly = navigationAssembly
    }
    
    func initialViewController() -> UIViewController {
        let vc = self.navigationAssembly.asemblyLoginOptionsVC()
        
        vc.handleSelect = {
            vc.selectButton.isHidden = true
            self.showSelectTenantView(vc)
        }
        
        return vc
    }
    
    private func showSelectTenantView(_ vc: LoginOptionsVC)
    {
        let selectTenantView = UINib(nibName: "SelectTenantView",
                                     bundle: nil).instantiate(withOwner: nil,
                                                              options: nil).first as! SelectTenantView
        selectTenantView.tenants = vc.dataSource.tenants
        
        selectTenantView.handleOkButtonTap = {
            if let tenant = selectTenantView.tenant {
                selectTenantView.isHidden = true
                
                self.showLogInView(vc: vc,
                                   tenant: tenant,
                                   selectTenantView: selectTenantView)
            }
        }
        
        selectTenantView.onDissmis = {
            selectTenantView.removeFromSuperview()
            vc.selectButton.isHidden = false
        }
        
        let width = vc.view.frame.size.width - DesignModel.SpacingViewX * 2
        let height = vc.view.frame.size.height - DesignModel.SpacingViewY * 2
        
        selectTenantView.frame = CGRect(x: DesignModel.SpacingViewX,
                                        y: DesignModel.SpacingViewY,
                                        width: width,
                                        height: height)
        vc.view.addSubview(selectTenantView)
    }
    
    private func showLogInView(vc: LoginOptionsVC, tenant: Tenant?, selectTenantView: SelectTenantView)
    {
        let logInView = UINib(nibName: "LogInView",
                              bundle: nil).instantiate(withOwner: nil,
                                                       options: nil).first as! LogInView
        logInView.tenant = tenant
        
        logInView.onDissmis = {
            vc.view.endEditing(true)
            selectTenantView.isHidden = false
        }
        
        logInView.handleLogInTap = {
            vc.view.endEditing(true)
            DLog("has not been implemented")
        }
        
        logInView.frame = CGRect(x: DesignModel.Zero,
                                 y: DesignModel.Zero,
                                 width: DesignModel.Zero,
                                 height: DesignModel.Zero)
        vc.view.addSubview(logInView)
    }
}
