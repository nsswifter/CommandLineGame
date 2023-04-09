//
//  BombGame.swift
//  CommandLineGame
//
//  Created by Mehdi Karami on 4/7/23.
//
//  See LICENSE folder for this project's licensing information.
//

// MARK: - Bomb Game

/// Conforms the Game protocol.
struct BombGame: Game {
    // Store the color theme of the game.
    var gameThemeColor = GameColor.cyan
    
    // Store history of playing of welcome message.
    var isWelcomeMessagePlayed = false
    
    // Length of the bomb's passcode.
    let passcodeLenght = 8
    // Number of chances the user has to guess the passcode.
    let chanceLenght = 8
    
    /// Generates a random numeric passcode of a given length.
    /// - Parameter length: The length of the passcode to generate.
    /// - Returns: A string representing the generated passcode.
    private func passcodeGenerator(with lenght: Int) -> String {
        (0..<lenght)
            .map { _ in "\(Int.random(in: 1...9))" }
            .joined()
    }
    
    /// Starts the game.
    mutating func start() {
        // If welcome message is not played, print it and change the flag.
        if !isWelcomeMessagePlayed {
            printColorful("""
            Welcome to BombGame!
            
            In this another EZ game you must neutral a bomb...
            The bomb has a passcode and You have only \(chanceLenght) chance to guess the passcode...
            Also The bomb passcode has \(passcodeLenght) digits ...
            And hopefully for any guess, you will see a report of your guess...
            
            \("GREEN:".green) Means that digit is correct.
              \("RED:".red) Means that digit is not correct.
            
            """)
            
            isWelcomeMessagePlayed = true
        }
        print("Press `Enter` key when you are ready ...".green)
        
        // Discards user input as it's not needed in this case.
        _ = readLine()
    }
    
    /// Checks the user's answer against the randomly generated passcode.
    /// The user has a limited number of chances to guess the correct passcode.
    /// After each guess, the function displays a string of X's and the number of correctly guessed digits in green and the incorrectly guessed digits in red.
    /// - Returns: true if the user guessed the correct passcode, false otherwise.
    func checkAnswer() -> Bool {
        // Generate passcode.
        let passcode = passcodeGenerator(with: passcodeLenght)
        
        // Stores the status of each digit in the passcode.
        var status = Array(repeating: "X", count: passcodeLenght)
        var answer = ""
        
        for time in 1...chanceLenght {
            print(status.joined(separator: "\t"), terminator: "\n\n")
            
            // Asks the user for their guess and validates the input.
            repeat {
                printColorful("Answer (Remain: \(chanceLenght - time)): ")

                if let generatedInput = readLine() {
                    answer = generatedInput
                } else {
                    debugPrint("There is no delegate for this type. Please insure that everything is allright in your controller!")
                    return false
                }
                
                if answer.count != passcodeLenght {
                    printColorful("Your input format is not true. Try again!")
                } else {
                    break
                }
            } while answer.count != chanceLenght
            
            // Updates the status array accordingly.
            for (index, char) in answer.enumerated() {
                if char == passcode[passcode.index(passcode.startIndex, offsetBy: index)] {
                    status[index] = String(char).green
                } else {
                    status[index] = String(char).red
                }
            }
            
            // Checks the user's guess against the passcode.
            if answer == passcode {
                return true
            }
        }
        
        // If the user has used all their chances without guessing the passcode correctly.
        print("\n" + "Oh! Bomb was crached. The Passcode was: \(passcode.yellow)".red + "\n")
        return false
    }
}
