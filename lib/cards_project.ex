defmodule CardsProject do
  @moduledoc """
  Provides methods for creating and handling a deck of cards
  """

  @doc """
  Return list of strings representing a deck of playing cards
  """

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

#   arrays =  for value <- values do
#      for suit <- suits do
#
#      end
#    end

  arrays = for value <- values, suit <- suits do
    "#{value} of #{suit}"
  end
    List.flatten(arrays)
  end

  @doc """
  Shuffle cards of deck
  """

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Determins whether a deck contains a diven card
  ##Examples
    iex(1)> deck = CardsProject.create_deck
    iex(2)> CardsProject.contains?(deck, "Ace of Spades")
    true
  """

  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  @doc """
    Divides a deck into a hand and the reminder of the deck.
    The `hand_size` argument indicates how many cards should be in the hand

    ##Example
      iex(1)> CardsProject.create_deck
      ["Ace of Spades", "Ace of Clubs", "Ace of Hearts", "Ace of Diamonds",
      "Two of Spades", "Two of Clubs", "Two of Hearts", "Two of Diamonds",
      "Three of Spades", "Three of Clubs", "Three of Hearts", "Three of Diamonds",
      "Four of Spades", "Four of Clubs", "Four of Hearts", "Four of Diamonds",
      "Five of Spades", "Five of Clubs", "Five of Hearts", "Five of Diamonds"]
      iex(2)> deck = CardsProject.create_deck
      ["Ace of Spades", "Ace of Clubs", "Ace of Hearts", "Ace of Diamonds",
      "Two of Spades", "Two of Clubs", "Two of Hearts", "Two of Diamonds",
      "Three of Spades", "Three of Clubs", "Three of Hearts", "Three of Diamonds",
      "Four of Spades", "Four of Clubs", "Four of Hearts", "Four of Diamonds",
      "Five of Spades", "Five of Clubs", "Five of Hearts", "Five of Diamonds"]
      iex(3)> {hand, rest} = CardsProject.deal(deck, 4)
      {["Ace of Spades", "Ace of Clubs", "Ace of Hearts", "Ace of Diamonds"],
      ["Two of Spades", "Two of Clubs", "Two of Hearts", "Two of Diamonds",
      "Three of Spades", "Three of Clubs", "Three of Hearts", "Three of Diamonds",
      "Four of Spades", "Four of Clubs", "Four of Hearts", "Four of Diamonds",
      "Five of Spades", "Five of Clubs", "Five of Hearts", "Five of Diamonds"]}
      iex(4)> hand
      ["Ace of Spades", "Ace of Clubs", "Ace of Hearts", "Ace of Diamonds"]
  """

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Save deck to text file
  """

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Load deck from text file
  """

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "File does not exist!"
    end
  end

  @doc """
    Create, shuffle and separate carts in deck
  """

  def create_hand(hand_size) do
    create_deck()
    |> shuffle
    |> deal(hand_size)
  end
end
