defmodule Enbot.Formatter do
  @moduledoc """
  Converts Floki html to readable stuff
  """

  def convert(html) do
    [_flag, _number, _timer, date, link, _authors, fee] =
      html
      |> Floki.find(".infoCell")

    """
    #{get_domain(html)} #{get_link(link)}
    [#{get_date(date)}] - #{get_fee(fee)}
    """
  end

  defp get_domain(html) do
    html
    |> Floki.find(".infoCellBold a")
    |> Floki.text
  end

  defp get_link(html) do
    link = Floki.find(html, "a")
    "<a href=\"#{Floki.attribute(link, "href")}\">#{Floki.text(link)}</a>"
  end

  defp get_date(html) do
    html |> Floki.find("span") |> Floki.text
  end

  defp get_utc_date(html) do
    [{_, _, [t]}] = Floki.find(html, "script")
    [[_, utc_date]] = Regex.scan(~r/DateToLocalString\('(.*)'\)\)/, t)
    utc_date
  end

  defp get_fee(html) do
    {int, label} =
      html
      |> Floki.text
      |> Integer.parse

    int = if int > 10000, do: int / 10000, else: int

    "#{int}#{label}"
  end
end
