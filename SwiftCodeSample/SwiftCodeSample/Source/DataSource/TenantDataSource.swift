//
//  TenantDataSource.swift
//  SwiftCodeSample
//
//  Created by Serik on 3/26/19.
//  Copyright © 2019 Serik_Klement. All rights reserved.
//

import Foundation

class TenantDataSource: TenantDataSourceProtocol {
    
    // MARK: Properties
    
    var observers: Set<Support.Observer<AnyObject>> = []
    private let networkClient: NetworkClientTenantProtocol
    var tenants = [Tenant]()
    
    // MARK: Lifecycle
    
    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }
    
    // MARK: Methods
    
    private func setTenants(_ tenants: [Tenant]?, completion: VoidCompletion?)
    {
        if let tempTenants = tenants {
            self.tenants = tempTenants
            completion?()
        }
    }
    
    func getTenantsRequests()
    {
        self.networkClient.getTenants(
            success: { [weak self] tenants in
                self?.setTenants(tenants) {
                    self?.notifyObserversWithError(nil)
                }
            },
            failure: { error in
                self.notifyObserversWithError(error)
        })
    }
}
