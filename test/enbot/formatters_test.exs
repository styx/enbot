defmodule Enbot.FormattersTest do
  use ExUnit.Case
  doctest Enbot

  test "convert" do
    formatted_game =
      Fixtures.html_game_row
      |> Enbot.Formatter.convert
    assert formatted_game == Fixtures.formatted_game

    # {"span", [{"id", "TimerTexttime52334818"}], ["10 дней 2 часа"]}
    # ["\r\n//<![CDATA[\t\r\nwindow.time52334818 = new Timer({\"days\":[\"дней\",\"день\",\"дня\"],\"hours\":[\"часов\",\"час\",\"часа\"],\"minutes\":[\"минут\",\"минуту\",\"минуты\"],\"seconds\":[\"секунд\",\"секунду\",\"секунды\"],\"StartCounter\":871268,\"TimeDirection\":\"Down\",\"ShowTimeUnits\":true,\"TimerTextID\":\"TimerTexttime52334818\",\"DisplayTwoTimes\":true}, this.TickHandlerStub);\r\n//]]>\r\n"]}]},
    # "sanek-bobr"
    # "7,48"
  end
end
