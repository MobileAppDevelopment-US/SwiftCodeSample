//
//  NetworkClientProtocol.swift
//  SwiftCodeSample
//
//  Created by Serik on 3/26/19.
//  Copyright © 2019 Serik_Klement. All rights reserved.
//

import Foundation

protocol NetworkClientProtocol: NetworkClientTenantProtocol { 
}

protocol NetworkClientTenantProtocol: ObserverPatternProtocol {
    
    func getTenants(success: (([Tenant]?) -> Void)?,  failure: ErrorCompletion?)
}
