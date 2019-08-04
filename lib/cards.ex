defmodule Cards do
  @moduledoc """
    Provides a set of operations to create and handle a deck of cards.
  """

  @doc """
    Return a list of strings mirroring a real life deck, with a set of individual cards and their suits.
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Splits a deck into two subgroups:
    - The first one group of data is referring to a hand that the user will receive, with an specified number of cards.
    - The second group consists of all the other cards that are remaining in the deck.
    The `hand_size` argument denotes how many cards should be given to the user.

  ## Examples

      iex > deck = Cards.create_deck()
      iex > {hand, rest_of_deck} = Cards.deal(deck, 1)
      iex > hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write!(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
