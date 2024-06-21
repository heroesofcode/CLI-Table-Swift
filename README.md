## CLI-Table-Swift

[![CI](https://github.com/heroesofcode/CLI-Table-Swift/actions/workflows/CI.yml/badge.svg)](https://github.com/heroesofcode/CLI-Table-Swift/actions/workflows/CI.yml)
[![Platform Compatibility](https://img.shields.io/badge/Platforms-%20macOS%20-orange)]()
[![GitHub License](https://img.shields.io/github/license/heroesofcode/CLI-Table-Swift)](https://github.com/heroesofcode/CLI-Table-Swift/blob/main/LICENSE)

Build Table for command line tools for macOS written in Swift

<img src="https://github.com/heroesofcode/CLI-Table-Swift/blob/main/assets/example.gif?raw=true">

```
┌─────────┬─────┬────────────────┐
│ Name    │ Age │ City           │
├─────────┼─────┼────────────────┤
│ Matheus │ 23  │ São Paulo      │
├─────────┼─────┼────────────────┤
│ Alice   │ 30  │ Rio de Janeiro │
└─────────┴─────┴────────────────┘
```

## Usage

Default with terminal color
```swift
import CLITable

let headers = ["Name", "Age", "City"]
        
var table = CLITable(headers: headers)

let rows = [
    ["Matheus", "23", "São Paulo"],
    ["Alice", "30", "Rio de Janeiro"]
]
        
table.addRows(rows)
table.showTable()
```
If you prefer, you can add the row like this
```swift
let headers = ["Name", "Age", "City"]
        
var table = CLITable(headers: headers)
        
table.addRow(["Matheus", "23", "São Paulo"])
table.addRow(["Matheus", "23", "São Paulo"])
        
table.showTable()
```

To customize the table you can add color to the line and text or just some of them
```swift
var table = CLITable(headers: headers, tableColor: .blue, textColor: .green)

or

var table = CLITable(headers: headers, tableColor: .blue)

or

var table = CLITable(headers: headers, textColor: .green)
```

## Installing

```swift
dependencies: [
  .package(
    url: "https://github.com/heroesofcode/CLI-Table-Swift",
    from: "1.0.0"
  ),
]
```

```swift
targets: [
  .target(name: "MyApp"),
  .testTarget(
    name: "MyAppTests",
    dependencies: [
      "MyApp",
      .product(name: "CLITable", package: "CLI-Table-Swift"),
    ]
  )
]
```

## Contributing

To contribute, just fork this project and then open a pull request, feel free to contribute, bring ideas and raise any problem in the issue tab.

## License

CLITable is released under the MIT license. See [LICENSE](https://github.com/heroesofcode/CLI-Table-Swift/blob/main/LICENSE) for details.
