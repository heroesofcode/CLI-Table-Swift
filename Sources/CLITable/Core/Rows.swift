//
//  Rows.swift
//
//
//  Created by João Lucas on 20/06/24.
//

import Foundation

final class Rows {
    
    public init() {}
    
    public func addRows(_ rows: [[String]]) {
        for row in rows {
            addRow(row)
        }
    }
    
    public func addRow(_ row: [String]) {
        guard row.count == headers.count else {
            print("Número de colunas na linha não corresponde ao número de cabeçalhos")
            return
        }
        
        rows.append(row)
        
        for (i, cell) in row.enumerated() {
            if cell.count > columnWidths[i] {
                columnWidths[i] = cell.count
            }
        }
    }
}
