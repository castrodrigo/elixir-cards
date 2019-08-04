defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "generates a list of cards" do
    assert Cards.create_deck() == ["Ace", "Two", "Three", "Four", "Five"]
  end
end
