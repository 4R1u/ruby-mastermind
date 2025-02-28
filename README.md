# Mastermind
This is a command-line version of Mastermind.

## Features
- Colored output
- Playing as the code-guesser
- Playing as the code-breaker

## Installation
You will need Ruby, which you can install through [rbenv](https://github.com/rbenv/rbenv#readme) on Linux/macOS, or [RubyInstaller](https://rubyinstaller.org/) on Windows.

Then, `git clone` this project:

```bash
git clone https://github.com/4R1u/ruby-mastermind.git
```

Navigate to the directory into which you cloned:

```bash
cd ruby-mastermind
```

Install the dependencies with Bundler:

```bash
bundle install
```

## Rules

The code-maker creates a 4-character string of non-unique numbers 1-6, and the guesser has 10 turns to guess what the code is

Each turn, the code guesser submits a code of their own, and the maker compares it with the code they have. For every character they got right, which is in the right place, they get a red peg for that guess. And each character that they get right, but not in the right place, they get a white peg.

The game is over when the guesser either runs out of turns, or guesses the code before that.

## Running
Simply launch the `main.rb` file through Bundler:

```bash
bundle exec ruby main.rb
```

### Choose mode
Enter 1 to create a code which the program should be able to guess in five moves, or 2 to have the program generate a code you have to guess.

#### Play as the creator of the code
Create a string of 4 characters 1-6, and write it down on some paper. When the program makes a guess, answer how many white and red pegs it got. If you answer correctly, it should solve the code withing 5 turns.

#### Play as the code guesser

Now the roles are reversed. The program creates the code and you guess. You have 10 turns to guess the code. Once the game is lost or won, you will be asked if you want to play again.

#### Exiting

When the game asks if you want to play again, answer 'y' to play again, and anything else, such as 'n' to quit.
