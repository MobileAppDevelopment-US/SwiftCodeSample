//
//  NetworkClient.swift
//  SwiftCodeSample
//
//  Created by Serik on 3/26/19.
//  Copyright © 2019 Serik_Klement. All rights reserved.
//

import Foundation
import Alamofire

class NetworkClient: NetworkClientProtocol {
    
    // MARK: Properties
    
    var observers: Set<Support.Observer<AnyObject>> = []
    var sessionManager: SessionManager!
    
    // MARK: Lifecycle
    
    init() { }
}

// MARK: - NetworkClientTenantProtocol

extension NetworkClient {
    
    enum TenantRouter: URLRequestConvertible {
        case getTenants
        
        internal func asURLRequest() throws -> URLRequest
        {
            switch self {
            case .getTenants:
                let getTenantsUrlPath = "https://itunes.applikator.dk/ios_task/tenants.json"
                var urlRequest = URLRequest(url: URL(string: getTenantsUrlPath)!)
                urlRequest.httpMethod = HTTPMethod.get.rawValue
                return try URLEncoding.default.encode(urlRequest, with: nil)
            }
        }
    }
    
    func getTenants(success: (([Tenant]?) -> Void)?, failure: ErrorCompletion?)
    {
        let completion: ((DataResponse<Any>) -> Void) = { [weak self] response in
            do {
                self?.printData(response)
                let tenants: [Tenant]? = self?.tenantsMap(data: response.data)?.tenants
                success?(tenants)
            } catch let error {
                failure?(error)
            }
        }
        
        let urlRequest = TenantRouter.getTenants
        let sessionManager = Alamofire.SessionManager.default
        sessionManager.request(urlRequest).validate().responseJSON(completionHandler: completion)
    }
    
    private func tenantsMap(data: Data?) -> TenantsResponse?
    {
        guard let data = data else { return nil }
        let decoder = JSONDecoder()
        let tenants = try? decoder.decode(TenantsResponse.self, from: data)
        return tenants
    }
    
    private func printData(_ response: DataResponse<Any>)
    {
        if let data = response.data {
            do {
                let printData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                printData?.forEach { print("\($0): \($1)") }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

