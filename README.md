# CommandLine Game

This project is a command-line game collection that includes different types of games such as math games, bomb defusing games, and flag-guessing games. The project is written in Swift and utilizes various programming concepts and skills, including Protocol-Oriented Programming (POP), Project organization and file structure (Clean Architecture), String manipulation using Result Builder and Extension and et cetera. The project also incorporates colorful and styled text output in the terminal to enhance the user experience (Terminal styling using ANSI escape codes).

![Introduction Demo.](Documentation/intro.mov)

## Table of Contents

- [Project Diagram](#project-diagram)
- [Games Lists](#games-lists)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributors)
- [Author](#author)
- [License](#license)

## Project Diagram

```bash
.
├── CommandLineGame
│   ├── App
│   │   ├── Controller
│   │   │   └── GameController.swift
│   │   └── View
│   │       ├── MessageView.swift
│   │       └── ResultBuilder
│   │           └── PrintExpensiveString.swift
│   ├── Core
│   │   ├── Entity
│   │   │   ├── BombGame.swift
│   │   │   ├── FlagGame.swift
│   │   │   ├── Game.swift
│   │   │   └── MathGame.swift
│   │   ├── Extention
│   │   │   └── StringColorsAndStyles.swift
│   │   └── ValueObjects
│   │       └── GameColor.swift
│   └── main.swift
│  
├── CommandLineGame.xcodeproj    
│  
├── LICENSE
│  
└── README.md
```

## Games Lists

The following games are currently included:

- [x] [MathGame](CommandLineGame/Core/Entity/MathGame.swift)
![MathGame Demo.](Documentation/mathGame.mov)

- [x] [BombGame](CommandLineGame/Core/Entity/BombGame.swift)
![BombGame Demo.](Documentation/bombGame.mov)

- [x] [FlagGame](CommandLineGame/Core/Entity/FlagGame.swift)
![FlagGame Demo.](Documentation/flagGame.mov)

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

Then enter the below command to execute compiled file.

```bash 
./main
```

![Usage Demo.](Documentation/usage.mov)

## Contributors

Feel free to share your ideas or any other problems. 
Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

## Author

- [Mehdi Karami](https://www.github.com/mehdi2003karami)

## License

`CommandLine Game` is released under an MIT license. See [LICENSE](LICENSE) for more information.
