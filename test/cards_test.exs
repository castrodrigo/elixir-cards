defmodule CardsTest do
  use ExUnit.Case, async: true
  doctest Cards

  test "create_deck generates 20 cards" do
    deck = Cards.create_deck()
    assert length(deck) == 20
  end

  test "shuffle should change the order of cards" do
    deck = Cards.create_deck()
    refute deck == Cards.shuffle(deck)
  end

  test "contains? should refute if the card is not on the deck" do
    deck = Cards.create_deck()
    refute Cards.contains?(deck, "random_card")
  end

  test "deal should bring exact amount of cards asked for" do
    deck = Cards.create_deck()
    to_hand = 3
    {hand, _rest_of_deck} = Cards.deal(deck, to_hand)

    assert length(hand) == to_hand
  end

  test "deal should remove the exact card of the ones as passed as params" do
    deck = Cards.create_deck()
    to_hand = 3
    {_hand, rest_of_deck} = Cards.deal(deck, to_hand)

    refute length(rest_of_deck) == length(deck)
    assert length(rest_of_deck) + to_hand == length(deck)
  end

  test "a deck can be saved to filesystem" do
    deck = Cards.create_deck()
    status = Cards.save(deck, "test_save")

    assert status == :ok
  end

  test "a deck can be loaded from filesystem" do
    deck = Cards.create_deck()
    Cards.save(deck, "test_save")

    deck_loaded = Cards.load("test_save")
    assert deck_loaded == deck
  end

  test "a deck should not be loaded if does not exist, returning error" do
    deck_loaded = Cards.load("test_which does not exist")
    assert deck_loaded == "File does not exist"
  end
end
