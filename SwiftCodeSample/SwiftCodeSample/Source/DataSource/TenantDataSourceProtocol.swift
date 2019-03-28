//
//  TenantDataSourceProtocol.swift
//  SwiftCodeSample
//
//  Created by Serik on 3/26/19.
//  Copyright © 2019 Serik_Klement. All rights reserved.
//

import Foundation

protocol TenantDataSourceProtocol: ObserverPatternProtocol {
    var tenants: [Tenant] { get }
    func getTenantsRequests()
}
