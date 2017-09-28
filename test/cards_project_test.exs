defmodule CardsProjectTest do
  use ExUnit.Case
  doctest CardsProject

  test "create_deck should makes 20 cards" do
    assert length(CardsProject.create_deck) === 20
  end
end
