//
//  RouterProtocol.swift
//  SwiftCodeSample
//
//  Created by Serik on 3/26/19.
//  Copyright © 2019 Serik_Klement. All rights reserved.
//

import UIKit

protocol RouterProtocol: TenantRouterProtocol {
}

protocol TenantRouterProtocol {
    func initialViewController() -> UIViewController
}
