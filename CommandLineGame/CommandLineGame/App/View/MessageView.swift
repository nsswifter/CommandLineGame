//
//  MessageView.swift.swift
//  CommandLineGame
//
//  Created by Mehdi Karami on 4/7/23.
//
//  See LICENSE folder for this project's licensing information.
//

import Foundation

// MARK: - Message View

/// Provides methods for displaying various messages related to the game.
struct MessageView {
    /// Displays the welcome message when the game starts.
    func welcomeMessage() {
        print("Hello buddy, Welcome to this Game.".green)
        print("What is your name?")
    }
    
    /// Displays the introduction message for the player.
    /// - Parameters:
    ///   - name: The name of the player.
    ///   - totalGame: The total number of games.
    func introdunction(for name: String, games: [Game]) {
        print("\n" + "Dear ".magenta + name.blue)
        
        print("""
            
            I have a secret box in my hand and there is a worth thing in it...
            I promise it's worth it ;)
            
            But if you want to see the contents of the box...
            You have to pass \(games.count) challenges...")
            Challengs are: [\(games.map { String(describing: type(of: $0)) }.joined(separator: ", "))]
            
            """.magenta)
    }
    
    /// Displys a message when the user chooses to exit the game.
    func terminateGame() {
        print("""
        We are sorry to see you go.
        Waiting for your return...
        Take Care Dude ;)
        """)
    }
    
    ///  Displays the victory message when the player has completed all games.
    func victoryMessage() {
        print("Well! You passed All the games. Are you ready to see the box [Y/n] ? ".green)
    }
}

// MARK: - Announcement Helper Functions

extension MessageView {
    /// Asks the player if they are ready to start the game.
    func preparateAnnounce() {
        print("Are you ready for challenges [Y/N] ?".cyan, terminator: " ")
    }
    
    /// Displays an warning message for invalid user input.
    func invalidInputAnnounce() {
        print("Your input is invalid!".yellow)
    }
    
    /// Displays the message when the player chooses to end the game to make sure the player is sure about their choice.
    func gameExitAnnounce() {
        print("""
        
        \("Opps :(".red)
        
        It's Alright.
        We can wait until you get ready...
        \("- If you are ready for challenges enter [Y]".green)
        \("- If you want to end the game enter [N]".red)
        
        """)
    }
}

// MARK: - Loading Pattern Helper Function

extension MessageView {
    /// Displays a loading animation for a given duration.
    /// - Parameter duration: The duration of the loading animation.
    /// - Parameter title: The title of the loading animation.
    func loadingPattern(for duration: TimeInterval, with title: String) {
        let message = "\(title) Loading"
        let delay: useconds_t = 500_000 // Delay for 500 milliseconds (0.5 seconds).
        let startTime = Date()
        
        print()
        repeat {
            print(message, terminator: "")
            fflush(stdout)
            usleep(delay)
            
            // Prints the dots.
            for _ in 1...3 {
                print(".", terminator: "")
                fflush(stdout)
                usleep(delay)
            }
            
            // Moves the cursor to the beginning of the line and clear it.
            print("\r\u{1B}[K", terminator: "")
        }  while Date().timeIntervalSince(startTime) < duration
        
        print("\(title) Loaded!", terminator: "\n\n")
    }
}
