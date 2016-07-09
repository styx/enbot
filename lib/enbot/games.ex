defmodule Enbot.Games do
  @moduledoc """
  Fetches the games list for Real and Points
  filtered by Belarus (for now at least)
  """

  @url "http://minsk.en.cx/GameCalendar.aspx?status=Coming&zone="

  def fetch_games(page) do
    fetch_table("Real", page) ++
    fetch_table("Points", page)
  end

  defp fetch_table(type, page) do
    type
    |> fetch_page(page)
    |> Floki.find(".table_light .infoRow")
    |> Enum.filter(&by_zone?/1)
  end

  defp fetch_page(type, page) do
    HTTPoison.get!("#{@url}#{type}&page=#{page}").body
  end

  defp by_zone?(row) do
    row
    |> Floki.find("img")
    |> Floki.attribute("src")
    |> List.first
    |> (&Regex.match?(~r/by.gif$/, &1)).()
  end
end
