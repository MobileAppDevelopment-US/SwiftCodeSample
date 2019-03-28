//
//  SelectTenantView+Table.swift
//  SwiftCodeSample
//
//  Created by Serik on 3/26/19.
//  Copyright © 2019 Serik_Klement. All rights reserved.
//

import UIKit

// MARK: - UITableViewDelegate

extension SelectTenantView: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tenants = tenants else { return 0 }
        return tenants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SelectTenantCell
        
        guard let tenants = tenants else { return UITableViewCell() }
        
        if tenants.count > 0 {
            cell.tenant = tenants[indexPath.row]
            cells.append(cell)
        }
        
        cell.handleSelect = { [weak self] in
            self?.showOrHideCircularViewByCell(cell)
            self?.tenant = self?.tenants?[indexPath.row]
        }
        return cell
    }
}

// MARK: - UITableViewDataSource

extension SelectTenantView: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DesignModel.HeightCell
    }
}

// MARK: - Methods

extension SelectTenantView  {
    
    private func showOrHideCircularViewByCell(_ cell: SelectTenantCell)
    {
        if cell.tapBlueView.isHidden == true {
            hiddenCircularViewByCell(cell)
        }
    }
    
    private func hiddenCircularViewByCell(_ cell: SelectTenantCell)
    {
        if cells.count > 0 {
            for i in 0...cells.count - 1 {
                cells[i].tapBlueView.isHidden = true
            }
            cell.tapBlueView.isHidden = false
        }
    }
}
