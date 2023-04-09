//
//  PrintExpensiveString.swift
//  CommandLineGame
//
//  Created by Mehdi Karami on 4/9/23.
//
//  See LICENSE folder for this project's licensing information.
//

// MARK: - Expensive String Printer Result Builder

/// Takes a list of strings and concatenates them into a single string separated by a space.
/// This result builder can be used to construct complex string messages with different styles and colors in a more readable and concise way.
@resultBuilder
struct ExpensiveStringPrinter {
    static func buildBlock(_ components: String...) -> String {
        components.joined(separator: " ")
    }
}

// MARK: - Print Expensive Strings Fucntion that use Expensive String Printer Result Builder

/// Prints a set of decorative strings with various colors and styles.
/// Useful for special messages that require emphasis.
func printExpensiveStrings(@ExpensiveStringPrinter builder: () -> String) {
    let text = builder()
    print(text)
}
