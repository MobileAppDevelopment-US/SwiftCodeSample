//
//  ComponentsAssembly.swift
//  SwiftCodeSample
//
//  Created by Serik on 3/27/19.
//  Copyright © 2019 Serik_Klement. All rights reserved.
//

import Foundation

class ComponentsAssembly: ComponentsAssemblyProtocol {
    
    static let shared = ComponentsAssembly()
    
    // MARK: Network
    
    var networkClient: NetworkClientProtocol {
        return NetworkClient()
    }
    
    // MARK: TenantDataSourceProtocol
    
    var tenantDataSourse: TenantDataSourceProtocol {
        return TenantDataSource(networkClient: networkClient)
    }
}

