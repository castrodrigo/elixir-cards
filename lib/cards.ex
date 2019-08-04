defmodule Cards do
  @moduledoc """
    Provides a set of operations to create and handle a deck of cards.
  """

  @doc """
    Returns a list of strings mirroring a real life deck, with a set of individual cards and their suits.
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Shuffles all the cards in the received `deck` param, returning a new list with different order than the original.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc ~S"""
    Verfies if one received `card` is inside a specified `deck`

  ## Examples

      iex> deck = Cards.create_deck()
      iex> Cards.contains?(deck, "Ace of Spades")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Splits a deck into two subgroups:
    - The first one group of data is referring to a hand that the user will receive, with an specified number of cards.
    - The second group consists of all the other cards that are remaining in the deck.
    The `hand_size` argument denotes how many cards should be given to the user.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> {hand, rest_of_deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Saves a generated `deck` to the OS FileSystem, using :erlang piece of code.
    A path can be passed in with the `filename` param.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write!(filename, binary)
  end

  @doc """
    Loads a file into module using readable format, after specifin a path in the `filename`.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not exist"
    end
  end

  @doc """
    Concats Cards.create_deck(), Cards.shuffle(deck) and Cards.deal(deck, hand_size) using Pipe operator, making one call only.
  """
  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
