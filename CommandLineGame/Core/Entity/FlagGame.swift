//
//  FlagGame.swift
//  CommandLineGame
//
//  Created by Mehdi Karami on 4/7/23.
//
//  See LICENSE folder for this project's licensing information.
//

// MARK: - Flag Game

/// Conforms the Game protocol.
struct FlagGame: Game {
    // Store the color theme of the game.
    var gameThemeColor = GameColor.blue
    
    // Store history of playing of welcome message.
    var isWelcomeMessagePlayed = false
    
    // Stores lenght of the flag.
    let flagLenght = 10
    
    /// Calculates the code for a given line of text.
    /// To calculate the code for a line, the function sums the ASCII code of all the characters in the line, then takes the result modulo 26.
    /// - Parameter line: The line of text for which to calculate the code.
    /// - Returns: The code for the line, as an integer between 0 and 25.
    private func getCode(_ line: String) -> Int {
        return line.unicodeScalars.map { Int($0.value) }.reduce(0, +) % 26
    }
    
    /// Generates a random row of characters and calculates its code.
    /// - Parameter length: The length of the row to generate.
    /// - Returns: A tuple containing the generated row and its calculated code.
    private func getRandomRow(_ length: Int) -> (expression: String, code: Int) {
        var phrase = [Int]()
        
        for _ in 0..<length {
            phrase.append(Int.random(in: 97...122))
        }
        
        let row = (phrase.map { String(UnicodeScalar($0)!) }).joined()
        let code = phrase.reduce(0, +) % 26
        
        return (row, code)
    }
    
    /// Checks if the given flag matches with the generated flag.
    /// - Parameters:
    ///   - rows: Array of strings where each string represents a row.
    ///   - flag: The flag that the user has submitted.
    /// - Returns: Boolean value indicating whether the submitted flag is correct or not.
    private func checkFlag(_ rows: [String], _ flag: String) -> Bool {
        var correct = true
        for (index, line) in rows.enumerated() {
            let code = getCode(line)
            let letter = Character(UnicodeScalar(code + 97)!)
            if letter != flag[flag.index(flag.startIndex, offsetBy: index)] {
                correct = false
                break
            }
        }
        return correct
    }
    
    mutating func start() {
        // If welcome message is not played, print it and change the flag.
        if !isWelcomeMessagePlayed {
            let (expression, code) = getRandomRow(flagLenght)
            printColorful("""
            Welcome to the Flag Game!
            
            In this game we have a flag (a expression) with \(flagLenght) length and \(flagLenght) lines...
            Each line has a line code that is calculated as follows:
            
            Each character of expression is represented by a line of code that contains a string of characters.
            To calculate the code for each line, you need to sum the ASCII code of all the characters in the line, then take the result modulo 26.
            The modulo operation gives you a value between 0 and 25, which corresponds to the nth letter of the alphabet (0=A, 1=B, 2=C, and so on).
            Your task is to calculate the code for each line and use the resulting values to form the flag.
            For `\(expression)` the code is \(code).
            Once you have the flag, you can submit it to complete the game. Good luck!
            
            """)
            
            isWelcomeMessagePlayed = true
        }
        
        print("Press `Enter` key when you are ready...".green)
        
        // Discards user input as it's not needed in this case.
        _ = readLine()
    }
    
    /// Asks the user to input a flag consisting of 10 characters and checks if it matches with randomly generated rows.
    /// - Returns: true if the flag is correct, false otherwise.
    func checkAnswer() -> Bool {
        // Stores the rows of characters that will be displayed to the player.
        var rows = [String]()
        
        for _ in 1...10 {
            let row = getRandomRow(flagLenght)
            rows.append(row.expression)
            
            printColorful(
                row.expression
                    .map { String($0) }
                    .joined(separator: " ")
            )
        }

        // Store the player's guess for the flag.
        var flag = ""
        
        // Asks the player to enter their guess.
        repeat {
            flag = readLine() ?? ""
            if flag.count != flagLenght {
                print("Flag must be 10 characters long. Try again.".yellow + "\n")
            }
        } while flag.count != flagLenght
        
        return checkFlag(rows, flag)
    }
}
