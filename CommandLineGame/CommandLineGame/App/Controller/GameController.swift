//
//  GameController.swift
//  CommandLineGame
//
//  Created by Mehdi Karami on 4/7/23.
//
//  See LICENSE folder for this project's licensing information.
//

// MARK: - Game Controller

/// Responsible for handling the main game logic.
struct GameController {
    // Initializes MessageView structs to handle messages respectively.
    let messageView = MessageView()
    
    // Defines an array of games, which the user can play. You can add more games ;)
    let games: [Game] = [MathGame(), BombGame(), FlagGame()]
    
    // Stores users name
    var name = ""
    
    /// Initiates the game by displaying a welcome message,
    /// Continues until the user decides to continue or exit the game.
    mutating func startGame() {
        messageView.welcomeMessage()
        
        // Prompts the user to enter their name and display intro message with available games.
        name = readLine()!
        messageView.introdunction(for: name, games: games)
        
        // Defines variables for use in a repeat-while loop to control game play.
        var askRepeatecount = 1
        var userAnswer: String
        
        // Loops through game play until user exits or reaches the maximum number of attempts.
        repeat {
            // Prompts the user to select a game or exit.
            messageView.preparateAnnounce()
            userAnswer = readLine()!
            
            // Checks the user's response to the exit prompt.
            if let unwrappedAnswer = continuePermission(userAnswer) {
                if unwrappedAnswer {
                    // Executes the available games.
                    extecuteGames()
                } else {
                    messageView.gameExitAnnounce()
                    askRepeatecount += 1
                }
            } else {
                messageView.invalidInputAnnounce()
            }
        } while askRepeatecount <= 2 && !(continuePermission(userAnswer) ?? false) == true
        
        // Displays termination message if user exceeds the maximum allowed attempts to exit the game.
        if askRepeatecount > 2 {
            messageView.terminateGame()
        }
    }
    
    /// Executes the games of the `games` array and handles the game flow.
    func extecuteGames() {
        for var game in games {
            var isAnswerCorrect = false
            
            // Loops through game play until user answers correctly.
            while !isAnswerCorrect {
                // Display loading animation for 3 seconds.
                messageView.loadingPattern(for: 3, with: String(describing: type(of: game)))
                
                game.start()
                
                // Checks if the user's answer is correct.
                if game.checkAnswer() {
                    isAnswerCorrect = true
                    print("Congratulations! \(type(of: game)) was passed.".green)
                } else {
                    // Displays game over message and prompts the user to try again.
                    print("""
                    Game over! You didn't get it.
                    Don't worry you can try again!
                    The MathGame will starts in 3 second later.
                    Try again:
                    """.red)
                }
            }
        }
        
        celebrateVictory()
    }
    
    /// Displays victory message and prompts the user to see the box.
    func celebrateVictory() {
        messageView.victoryMessage()
        
        if let answer = continuePermission(readLine() ?? "") {
            if !answer {
                print("You must be :)".red)
                print("I enter `YES` for you =D".magenta)
            }
        } else {
            messageView.invalidInputAnnounce()
            print("But It's alright. I enter `YES` for you =D".magenta)
        }
        
        // Display loading animation for 3 seconds.
        messageView.loadingPattern(for: 3, with: "Your Gift")
        
        // Prints a set of decorative strings with various colors and styles.
        printExpensiveStrings {
            "♥︎".italic.blue
            " Happy Birthday To You".italic.blue
            "Dear \(name)".bold.magenta
            "♥︎".italic.blue
            "\n"
            " Wish you luck Dude ".inverse.bold.magenta
            "\n"
            "Hope You Enjoy...".underline.cyan
        }
    }
}

// MARK: - continue Permission Helper Function

extension GameController {
    ///  Checks user input to continue or stop the game.
    /// - Parameter text: User's input.
    /// - Returns: A boolean value of true if the user wants to continue the game, false if they want to exit, or nil if input is invalid.
    func continuePermission(_ text: String) -> Bool? {
        if text.lowercased() == "y" || text.lowercased() == "yes" {
            return true
        } else if text.lowercased() == "n" || text.lowercased() == "no" {
            return false
        } else {
            return nil
        }
    }
}
