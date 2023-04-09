//
//  StringTerminalColors.swift
//  CommandLineGame
//
//  Created by Mehdi Karami on 4/7/23.
//
//  See LICENSE folder for this project's licensing information.
//

// MARK: - String Terminal Colors

/// An extension on String that provides properties for different colors and styles in the terminal.
/// Also provide a function that wrapp a string in the appropriate escape codes for the given color of type `GameColor`.
/// This extension uses the `ANSI` escape codes to provide terminal colors.
/// Each color property returns a new string, with the original string wrapped in the appropriate escape codes for the corresponding color.
/// The available colors are: `black`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, `white`.
/// The available styles are: `bold`, `italic`, `underline`, `inverse`.
extension String {
    var black: String {
        "\u{001B}[0;30m\(self)\u{001B}[0m"
    }
    
    var red: String {
        "\u{001B}[0;31m\(self)\u{001B}[0m"
    }
    
    var green: String {
        "\u{001B}[0;32m\(self)\u{001B}[0m"
    }
    
    var yellow: String {
        "\u{001B}[0;33m\(self)\u{001B}[0m"
    }
    
    var blue: String {
        "\u{001B}[0;34m\(self)\u{001B}[0m"
    }
    
    var magenta: String {
        "\u{001B}[0;35m\(self)\u{001B}[0m"
    }
    
    var cyan: String {
        "\u{001B}[0;36m\(self)\u{001B}[0m"
    }
    
    var white: String {
        "\u{001B}[0;37m\(self)\u{001B}[0m"
    }
    
    var bold: String {
        "\u{001B}[1m" + self + "\u{001B}[0m"
    }
    
    var italic: String {
        "\u{001B}[3m" + self + "\u{001B}[23m"
    }
    
    var underline: String {
        "\u{001B}[4m" + self + "\u{001B}[24m"
    }
    
    var inverse: String {
        "\u{001B}[7m" + self + "\u{001B}[27m"
    }
    
    /// Returns a new string with the original string wrapped in the appropriate escape codes for the given color.
    /// - Parameter color: The color to apply to the string.
    /// - Returns: A new string with the original string wrapped in the appropriate escape codes for the given color.
    func applyingColor(_ color: GameColor) -> String {
        switch color {
        case .black:
            return black
        case .red:
            return red
        case .green:
            return green
        case .yellow:
            return yellow
        case .blue:
            return blue
        case .magenta:
            return magenta
        case .cyan:
            return cyan
        case .white:
            return white
        }
    }
}


