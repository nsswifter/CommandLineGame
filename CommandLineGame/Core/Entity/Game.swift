//
//  Game.swift
//  CommandLineGame
//
//  Created by Mehdi Karami on 4/7/23.
//
//  See LICENSE folder for this project's licensing information.
//

// MARK: - Game

/// Provides properties and methods common to all games.
protocol Game {
    // Store the color theme of the game.
    var gameThemeColor: GameColor { get }
    
    // Store history of playing of welcome message.
    var isWelcomeMessagePlayed: Bool { get }
    
    /// Prints colorful text in the console.
    /// - Parameters:
    ///     - text: The text to be printed in the console.
    ///     - separator: The separator between each text. Default value is " ".
    ///     - terminator: The terminator character at the end of the text. Default value is "\n".
    func printColorful(_ text: String, separator: String, terminator: String)
    
    /// Starts the game.
    mutating func start()
    
    /// Checks the answer of the game.
    /// - Returns: A Boolean value indicating whether the answer is correct or not.
    func checkAnswer() -> Bool
}


// MARK: - Default Implementation of printColorful()

/// Adds a default implementation of printColorful() method.
extension Game {
    func printColorful(_ text: String, separator: String = " ", terminator: String = "\n") {
        print(text.applyingColor(gameThemeColor), separator: separator, terminator: terminator)
    }
}
