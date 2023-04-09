# Birthday Surprise Command-Line Game

This project is a command-line game collection that includes different types of games such as math games, bomb defusing games, and flag-guessing games. The project is written in Swift and utilizes various programming concepts and skills, including Protocol-Oriented Programming (POP), Project organization and file structure (Clean Architecture), String manipulation using Result Builder and Extension and et cetera. The project also incorporates colorful and styled text output in the terminal to enhance the user experience (Terminal styling using ANSI escape codes).

## Table of Contents

- [Games Lists](#games-lists)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributors)
- [Author](#author)
- [License](#license)

## Games Lists

The following games are currently included:

- [x] MathGame
- [x] BombGame
- [x] FlagGame

Each game has its own set of rules and gameplay mechanics. See the documentation in each respective file for more information.

## Installation

To install this project, simply clone the repository to your local machine:

```console 
git clone https://github.com/mehdi2003karami/CommandLineGame.git
```

## Usage
To run the game via Xcode simply build and run it.
- Note: Make Sure that Terminal scheme is chosen.
To run the game via Terminal, navigate to the inner CommandLineGame directory and run the main.swift file for the game you wish to play:

```console
swiftc \
main.swift \
App/Controller/GameController.swift \
App/View/MessageView.swift \
App/View/ResultBuilder/PrintExpensiveString.swift \
Core/Entity/BombGame.swift \
Core/Entity/FlagGame.swift \
Core/Entity/Game.swift \
Core/Entity/MathGame.swift \
Core/Extention/StringColorsAndStyles.swift \
Core/ValueObjects/GameColor.swift
```

## Contributors

Feel free to share your ideas or any other problems. 
Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

## Author

- [Mehdi Karami](https://www.github.com/mehdi2003karami)

## License

`Birthday Surprise Game` is released under an MIT license. See [LICENSE](LICENSE) for more information.
