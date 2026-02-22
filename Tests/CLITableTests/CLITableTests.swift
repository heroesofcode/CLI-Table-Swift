import XCTest
@testable import CLITable

final class CLITableTests: XCTestCase {

    func testAddRow() throws {
        var table = CLITable(headers: ["Name", "Age", "City"])
        try table.addRow(["Alice", "30", "São Paulo"])
        XCTAssertEqual(table.rows.count, 1)
    }

    func testAddRows() throws {
        var table = CLITable(headers: ["Name", "Age", "City"], tableColor: .blue)
        let rows = [
            ["Alice", "30", "São Paulo"],
            ["Bob", "25", "Rio de Janeiro"],
            ["Carlos", "28", "Belo Horizonte"]
        ]
        
        try table.addRows(rows)
        XCTAssertEqual(table.rows.count, 3)
    }

    func testPrintTable() throws {
        var table = CLITable(headers: ["Name", "Age", "City"])
        try table.addRow(["Alice", "30", "São Paulo"])
        try table.addRows([
            ["Bob", "25", "Rio de Janeiro"],
            ["Carlos", "28", "Belo Horizonte"]
        ])

        table.showTable()
    }

    func testColumnMismatchError() {
        var table = CLITable(headers: ["Name", "Age"])
        XCTAssertThrowsError(try table.addRow(["Alice", "30", "Extra"])) { error in
            guard case CLITableError.columnMismatch(let expected, let got) = error else {
                return XCTFail("Wrong error type")
            }
            XCTAssertEqual(expected, 2)
            XCTAssertEqual(got, 3)
        }
    }

    func testColumnWidthUpdate() throws {
        var table = CLITable(headers: ["A", "B"])
        XCTAssertEqual(table.columnWidths, [1, 1])
        try table.addRow(["Short", "VeryLongValue"])
        XCTAssertEqual(table.columnWidths, [5, 13])
    }

    func testAllTableColors() throws {
        var table = CLITable(headers: ["C"], tableColor: .black)
        try table.addRow(["1"])
        table.showTable()

        table = CLITable(headers: ["C"], tableColor: .red)
        table.showTable()

        table = CLITable(headers: ["C"], tableColor: .green)
        table.showTable()

        table = CLITable(headers: ["C"], tableColor: .yellow)
        table.showTable()

        table = CLITable(headers: ["C"], tableColor: .magenta)
        table.showTable()

        table = CLITable(headers: ["C"], tableColor: .cyan)
        table.showTable()

        table = CLITable(headers: ["C"], tableColor: .white)
        table.showTable()

        table = CLITable(headers: ["C"], tableColor: .hex("#FF5733"))
        table.showTable()
    }

    func testAllTextColors() throws {
        var table = CLITable(headers: ["C"], textColor: .black)
        try table.addRow(["1"])
        table.showTable()

        table = CLITable(headers: ["C"], textColor: .red)
        table.showTable()

        table = CLITable(headers: ["C"], textColor: .green)
        table.showTable()

        table = CLITable(headers: ["C"], textColor: .yellow)
        table.showTable()

        table = CLITable(headers: ["C"], textColor: .magenta)
        table.showTable()

        table = CLITable(headers: ["C"], textColor: .cyan)
        table.showTable()

        table = CLITable(headers: ["C"], textColor: .white)
        table.showTable()

        table = CLITable(headers: ["C"], textColor: .hex("#2ECC71"))
        table.showTable()
    }

    func testBothColors() throws {
        var table = CLITable(headers: ["Name"], tableColor: .blue, textColor: .green)
        try table.addRow(["Test"])
        table.showTable()
    }

    func testEmptyTable() {
        let table = CLITable(headers: ["A", "B", "C"])
        table.showTable()
    }
}
