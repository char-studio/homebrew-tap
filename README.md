# Char Studio for Homebrew

Command-line tools from [Char Studio](https://charstudio.app).

## Charcal

The command-line client for [Charcal](https://charcal.charstudio.app), the day planner for iPhone, iPad and Mac.

```sh
brew install char-studio/tap/charcal
charcal token chc_...
```

Copy your personal token from the app: Settings, Account, API token.

```sh
charcal today
charcal add "tomorrow at 8 dentist #personal"
charcal done dentist
charcal help
```

`charcal` reads sentences in English or Italian. It follows the language of your Charcal account; `charcal language it` or `charcal language en` changes it. Every list also comes out as JSON with `--json`.

Requires macOS 15 or later, on Apple silicon or Intel. Every command and the AI assistant setup: [charcal.charstudio.app/developers](https://charcal.charstudio.app/developers).
