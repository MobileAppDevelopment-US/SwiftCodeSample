//
//  NavigationAssemblyProtocol.swift
//  SwiftCodeSample
//
//  Created by Serik on 3/27/19.
//  Copyright © 2019 Serik_Klement. All rights reserved.
//

import Foundation

protocol NavigationAssemblyProtocol: NavigationAssemblyTenantProtocol { 
    
}

protocol NavigationAssemblyTenantProtocol {
    func asemblyLoginOptionsVC() -> LoginOptionsVC
}
