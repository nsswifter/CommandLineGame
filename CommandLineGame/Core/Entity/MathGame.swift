//
//  MathGame.swift
//  CommandLineGame
//
//  Created by Mehdi Karami on 4/7/23.
//
//  See LICENSE folder for this project's licensing information.
//

// MARK: - Math Game

/// Conforms the Game protocol.
struct MathGame: Game {
    // Store the color theme of the game.
    let gameThemeColor = GameColor.yellow
    
    // Stores the factors of the equation.
    var factors: [Int] = []
    
    // Store history of playing of welcome message.
    var isWelcomeMessagePlayed = false
    
    /// Generates random factors.
    private func getFactors() -> [Int] {
        let factorCount = Int.random(in: 2...3)
        return (1...factorCount).map { _ in Int.random(in: 1...10) }
    }
    
    /// Changes format of the answer input.
    private func changeAnswerFormat(rawAnswer: String) -> [Int]? {
        // Split the raw answer string by space and return an sorted array of Int.
        rawAnswer
            .split(separator: " ")
            .compactMap { Int($0) }
            .sorted()
    }
    
    /// Starts the game.
    mutating func start() {
        // If welcome message is not played, print it and change the flag.
        if !isWelcomeMessagePlayed {
            printColorful("Welcome to MathGame!", terminator: "\n\n")
            isWelcomeMessagePlayed = true
        }
        
        printColorful("Solve this equation for x: ")
        
        // Generate factors, sort and print the equation with the factors.
        factors = getFactors().sorted()
        for factor in factors {
            print("(x - \(factor))", terminator: " ")
        }
        print("= 0")
        
        // Print instructions for answer input.
        printColorful("""
        You have to enter \(factors.count) numbers with a space between them.
        
        Answer:
        """, terminator: " ")
    }
    
    /// This function checks the answer input by the user.
    func checkAnswer() -> Bool {
        // Read the user input.
        guard let answer = readLine() else {
            debugPrint("There is no delegate for this type. Please insure that everything is allright in your controller!")
            return false
        }
        
        // Loop until the correct format of input is entered.
        while true {
            let answer = changeAnswerFormat(rawAnswer: answer)
            
            // If the input is correctly formatted, compare with the factors and return result.
            if let answer {
                return factors == answer
            } else {
                // Print error message and ask for input again.
                print("Your input format is incorrect.".red)
                printColorful("Try again:")
            }
        }
    }
}
