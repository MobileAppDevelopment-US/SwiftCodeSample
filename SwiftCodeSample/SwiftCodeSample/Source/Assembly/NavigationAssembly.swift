//
//  NavigationAssembly.swift
//  SwiftCodeSample
//
//  Created by Serik on 3/27/19.
//  Copyright © 2019 Serik_Klement. All rights reserved.
//

import UIKit

class NavigationAssembly: NavigationAssemblyProtocol {
    
    var components: ComponentsAssemblyProtocol
    
    init(componentsAssembly: ComponentsAssemblyProtocol) {
        self.components = componentsAssembly
    }
    
    internal func instantiateVC(Class aClass : AnyClass,
                                Storyboard storyboard : UIStoryboard) -> AnyObject
    {
        let path = NSStringFromClass(aClass).components(separatedBy: ".");
        let identifier = path.last!
        let vc = storyboard.instantiateViewController(withIdentifier: identifier)
        
        return vc
    }
    
    internal func storyboardWithName(_ name: StoryboardName) -> UIStoryboard {
        return UIStoryboard(name: name.rawValue, bundle: Bundle(for: type(of: self)))
    }
}

// MARK: - NavigationAssemblyTenantProtocol

extension NavigationAssembly {
    
    func asemblyLoginOptionsVC() -> LoginOptionsVC
    {
        let vc = self.instantiateVC(Class: LoginOptionsVC.self, Storyboard: loginOptionsStoryboard) as! LoginOptionsVC
        vc.dataSource = components.tenantDataSourse
        
        return vc
    }
}

// MARK: - NavigationAssembly + enum

extension NavigationAssembly
{
    enum StoryboardName: String
    {
        case loginOptions = "LoginOptions"
        
        init?(string: String?) {
            if string == nil { return nil }
            self.init(rawValue: string!)
        }
    }
    
    var loginOptionsStoryboard: UIStoryboard {
        return storyboardWithName(.loginOptions)
    }
}
