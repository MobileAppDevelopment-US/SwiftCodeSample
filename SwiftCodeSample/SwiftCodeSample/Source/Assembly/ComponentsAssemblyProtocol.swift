//
//  ComponentsAssemblyProtocol.swift
//  SwiftCodeSample
//
//  Created by Serik on 3/27/19.
//  Copyright © 2019 Serik_Klement. All rights reserved.
//

import Foundation

protocol ComponentsAssemblyProtocol: ComponentsAssemblyTenantProtocol {
    var networkClient: NetworkClientProtocol { get }
}

protocol ComponentsAssemblyTenantProtocol {
    var tenantDataSourse: TenantDataSourceProtocol { get }
}
