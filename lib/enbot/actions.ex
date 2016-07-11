defmodule Enbot.Actions do
  alias Enbot.Games
  alias Enbot.Formatter

  @moduledoc """
  Contains functions to respond to user requests
  """

  def help do
    """
    /games, /естькакиеигры - список ближайших игр в РБ
    /help - показать это сообщение
    Пока это все, что умеет этот бот. Идеи приветствуются.
    """
  end

  def fetch_games do
    # (Games.fetch_games(1) ++
    # Games.fetch_games(2) ++
    # Games.fetch_games(3))
    Games.fetch_games(1)
    |> Enum.map(&Formatter.convert/1)
  end
end
