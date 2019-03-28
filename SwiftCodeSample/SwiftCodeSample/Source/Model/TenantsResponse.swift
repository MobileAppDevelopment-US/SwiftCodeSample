//
//  TenantsResponse.swift
//  SwiftCodeSample
//
//  Created by Serik on 3/27/19.
//  Copyright © 2019 Serik_Klement. All rights reserved.
//

import Foundation

class TenantsResponse: Codable {
    let tenants: [Tenant]
    
    init(tenants: [Tenant]) {
        self.tenants = tenants
    }
}

class Tenant: Codable {
    let name: String
    let securityTypes: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case securityTypes = "security_types"
    }
    
    init(name: String, securityTypes: [String]) {
        self.name = name
        self.securityTypes = securityTypes
    }
}
