defmodule Enbot.FormattersTest do
  use ExUnit.Case
  doctest Enbot.Formatter

  test "convert" do
    formatted_game =
      Fixtures.html_game_row
      |> Enbot.Formatter.convert
    assert formatted_game == Fixtures.formatted_game
  end
end
