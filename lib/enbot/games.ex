defmodule Enbot.Games do
  @url "http://minsk.en.cx/GameCalendar.aspx?status=Coming&zone="

  def fetch_games(page) do
    fetch_table("Real", page) ++
    fetch_table("Points", page)
  end

  defp fetch_table(type, page) do
    fetch_page(type, page)
    |> Floki.find(".table_light tr")
    |> Stream.drop(1)
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
