defmodule Enbot.Actions do
  alias Enbot.Games
  alias Enbot.Formatter

  @moduledoc """
  Contains functions to respond to user requests
  """

  def help do
    """
    /games - список ближайших игр в РБ
    /help - показать помощь
    Пока это все, что умеет этот бот. Идеи приветствуются.
    """
  end

  def fetch_games do
    games =
      Games.fetch_games(1) ++
      Games.fetch_games(2) ++
      Games.fetch_games(3)

    games
    |> Stream.map(&Formatter.convert/1)
    |> Enum.sort_by(fn({date, _}) -> date |> Timex.to_unix end)
    |> Enum.map(fn({_, text}) -> text end)
  end
end
