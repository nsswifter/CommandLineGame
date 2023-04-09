//
//  GameColor.swift
//  CommandLineGame
//
//  Created by Mehdi Karami on 4/9/23.
//
//  See LICENSE folder for this project's licensing information.
//

// MARK: - Game Color

/// Represents different colors that can be used in a game or terminal application.
/// The available colors are: `black`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, `white`.
/// Used as an argument to the applyingColor() method of
/// the String extension to apply a specific color to a string in the terminal.
enum GameColor {
    case black
    case red
    case green
    case yellow
    case blue
    case magenta
    case cyan
    case white
}
