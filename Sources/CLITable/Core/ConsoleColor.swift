public enum TableColor: String {
    case black = "\u{001B}[0;30m"
    case red = "\u{001B}[0;31m"
    case green = "\u{001B}[0;32m"
    case yellow = "\u{001B}[0;33m"
    case blue = "\u{001B}[0;34m"
    case magenta = "\u{001B}[0;35m"
    case cyan = "\u{001B}[0;36m"
    case white = "\u{001B}[0;37m"
    case reset = "\u{001B}[0;0m"
}

func console(
    _ text: String,
    color: TableColor,
    terminator: String = "\n"
) {

    print("\(color.rawValue)\(text)\(TableColor.reset.rawValue)", terminator: terminator)
}

func colorText(
    _ text: String,
    color: TableColor
) -> String {

    "\(color.rawValue)\(text)\(TableColor.reset.rawValue)"
}
