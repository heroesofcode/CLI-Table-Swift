//
//  ShowTable.swift
//
//
//  Created by João Lucas on 20/06/24.
//

import Foundation

public final class ShowTable {
    
    private var headers: [String]
    private var rows: [[String]]
    private var columnWidths: [Int]

    public init(
        headers: [String],
        rows: [[String]],
        columnWidths: [Int]) {
        self.headers = headers
        self.rows = rows
        self.columnWidths = columnWidths
    }
    
    public func showTable() {
        printLine(start: "┌", middle: "┬", end: "┐", separator: "─")
        printRow(headers, isHeader: true)
        
        for (index, row) in rows.enumerated() {
            printRow(row)
            if index < rows.count - 1 {
                printLine(start: "├", middle: "┼", end: "┤", separator: "─")
            }
        }
        
        printLine(start: "└", middle: "┴", end: "┘", separator: "─")
    }
    
    private func printLine(
        start: String, 
        middle: String,
        end: String,
        separator: String) {
            
        print(start, terminator: "")
        for (i, width) in columnWidths.enumerated() {
            if i > 0 {
                print(middle, terminator: "")
            }
            print(String(repeating: separator, count: width + 2), terminator: "")
        }
        print(end)
    }

    private func printRow(
        _ row: [String],
        isHeader: Bool = false) {
            
        print("│", terminator: "")
            
        for (i, cell) in row.enumerated() {
            let padding = String(repeating: " ", count: columnWidths[i] - cell.count)
            print(" \(cell)\(padding) │", terminator: "")
        }
            
        print()
            
        if isHeader {
            printLine(start: "├", middle: "┼", end: "┤", separator: "─")
        }
    }
}
