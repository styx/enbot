defmodule Enbot.Formatter do
  @moduledoc """
  Converts Floki html to readable stuff
  """

  @byn_byr_limit 10_000

  def convert(html) do
    [_flag, _number, _timer, date, link, _authors, fee] =
      html
      |> Floki.find(".infoCell")

    utc_date = get_utc_date(date)

    {
      utc_date,
      """
      <strong>#{get_domain(html)}</strong> #{get_link(link)} [#{get_date(utc_date)}]\n#{get_fee(fee)}\n
      """
    }
  end

  defp get_domain(html) do
    html
    |> Floki.find(".infoCellBold a")
    |> Floki.text
    |> String.split(".")
    |> List.first
  end

  defp get_link(html) do
    link = Floki.find(html, "a")
    "<a href=\"#{Floki.attribute(link, "href")}\">#{Floki.text(link)}</a>"
  end

  defp get_date(utc_date) do
    utc_date
    |> Timex.Timezone.convert("Europe/Minsk")
    |> Timex.format!("{0D}.{0M}.{YYYY} / {h24}:{0m}")
  end

  defp get_utc_date(html) do
    [{_, _, [t]}] = html |> Floki.find("script")
    [[_, utc_date]] = Regex.scan(~r/DateToLocalString\('(.*)'\)\)/, t)
    Timex.parse!(utc_date, "{Mfull} {0D}, {YYYY} {h24}:{m}:{s} {Zname}")
  end

  defp get_fee(html) do
    fee =
      html
      |> Floki.text
      |> Integer.parse

    case fee do
      {int, label} ->
        int = if int > @byn_byr_limit, do: int / @byn_byr_limit, else: int
        "#{int}#{label}"
      :error ->
        "N/A"
    end
  end
end
