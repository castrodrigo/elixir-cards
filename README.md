# Cards

Cards is a project intended to improve my Elixir coding skills, allowing me to dive more into it's concepts.

Some of the concepts that are used on this POC:

- Main libraries
- Pattern matching
- Functional only use of data
- Error handling
- Documentation
- Testing

## Main Goal

The main goal of this application is to create a Module which enables the user, via command line, to create and handle a deck of cards, being able to:

- Create a Deck
- Shuffle a Deck
- Give a user a hand with X cards
- Save the deck to FileSystem
- Load the deck from FileSystem
- Give a hand (automatically, having the deck created, shuffled and the cards from the hand separated)

## Docs

To generate the Docs of the module it is necessary just to open a terminal window, inside the base folder of the module and then type

```
mix docs
```

## Testing

Elixir has a quite rich out-of-the-box testing support, so additional plugins or libraries are not needed in order to make the tests run or you to right them. Go to the base folder of the module and then type

```
mix type
```

## Installation

### Elixir

Excelent tutorial on official [doc](https://elixir-lang.org/install.html)

### After clone

In order to download all the dependencies needed for the application to work run

```
mix deps.get
```

### As a Package

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `cards` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:cards, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/cards](https://hexdocs.pm/cards).

## References

This application was suggested as warm up project to get into Elixir, in [Stephen Grider's course at Udemy](https://www.udemy.com/the-complete-elixir-and-phoenix-bootcamp-and-tutorial).
