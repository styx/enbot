defmodule Fixtures do
  @domain "bobr.en.cx"
  @html_game_row [{"tr",
          [{"id", "ctl18_ctl00_GamesRepeater_ctl15_trItem"}, {"class", "infoRow"}],
          [{"td", [{"align", "center"}, {"nowrap", "nowrap"}, {"class", "infoCell"}],
            [{"img",
              [{"width", "26"}, {"height", "17"}, {"border", "0"},
               {"src", "http://cdn.endata.cx/images/countries/by.gif"},
               {"alt", "Беларусь"}, {"title", "Беларусь"}], []}]},
           {"td", [{"align", "center"}, {"nowrap", "nowrap"}, {"class", "infoCell"}],
            [{"span", [{"class", "yellow_darkgreen"}], ["#"]},
             {"span",
              [{"id", "ctl18_ctl00_GamesRepeater_ctl15_lblGameNum"}, {"class", "gold"},
               {"title", "Порядковый номер"}], ["33"]}, "/",
             {"span",
              [{"id", "ctl18_ctl00_GamesRepeater_ctl15_lblGameID"},
               {"class", "gold_bold"}, {"title", "Уникальный номер"}],
              ["55744"]}]},
           {"td", [{"align", "center"}, {"nowrap", "nowrap"}, {"class", "infoCell"}],
            [{"span", [{"id", "TimerTexttime52334818"}], ["10 дней 2 часа"]},
             {"script", [{"type", "text/javascript"}],
              ["\r\n//<![CDATA[\t\r\nwindow.time52334818 = new Timer({\"days\":[\"дней\",\"день\",\"дня\"],\"hours\":[\"часов\",\"час\",\"часа\"],\"minutes\":[\"минут\",\"минуту\",\"минуты\"],\"seconds\":[\"секунд\",\"секунду\",\"секунды\"],\"StartCounter\":871268,\"TimeDirection\":\"Down\",\"ShowTimeUnits\":true,\"TimerTextID\":\"TimerTexttime52334818\",\"DisplayTwoTimes\":true}, this.TickHandlerStub);\r\n//]]>\r\n"]}]},
           {"td",
            [{"align", "center"}, {"nowrap", "nowrap"}, {"class", "infoCellBold"}],
            [{"a",
              [{"href", "http://bobr.en.cx/"},
               {"id", "ctl18_ctl00_GamesRepeater_ctl15_lnkSiteInfo"},
               {"target", "_blank"}], ["bobr.en.cx"]}]},
           {"td", [{"align", "center"}, {"nowrap", "nowrap"}, {"class", "infoCell"}],
            [{"span",
              [{"id", "ctl18_ctl00_GamesRepeater_ctl15_startDate_writeStartDate_span"}],
              ["16 июля 2016 г. 18:00:00"]},
             {"script", [{"type", "text/javascript"}],
              ["/*<![CDATA[*/ write('ctl18_ctl00_GamesRepeater_ctl15_startDate_writeStartDate_span', DateToLocalString('July 16, 2016 15:00:00 UTC'));//]]>"]}]},
           {"td", [{"align", "center"}, {"class", "infoCell"}],
            [{"a",
              [{"href", "http://bobr.en.cx/GameDetails.aspx?gid=55744"},
               {"id", "ctl18_ctl00_GamesRepeater_ctl15_lnkGameTitle"},
               {"class", "yellow_darkgreen"}], ["ЦвеТочки"]}]},
           {"td", [{"align", "center"}, {"class", "infoCell"}],
            [{"a",
              [{"href", "/UserDetails.aspx?uid=170091"},
               {"id",
                "ctl18_ctl00_GamesRepeater_ctl15_AuthorsRepeater_ctl00_lnkAuthor"},
               {"target", "_blank"}], ["sanek-bobr"]}, " (",
             {"span",
              [{"id", "ctl18_ctl00_GamesRepeater_ctl15_AuthorsRepeater_ctl00_lblIndex"},
               {"class", "light_blue"}], ["7,48"]}, ")\r\n\t\t\t\t\t\r\n\t\t\t"]},
           {"td", [{"align", "center"}, {"nowrap", "nowrap"}, {"class", "infoCell"}],
            [{"a",
              [{"id", "ctl18_ctl00_GamesRepeater_ctl15_FeeLink"}, {"class", "white"},
               {"href", "http://bobr.en.cx/MakeGameFee.aspx?gid=55744"},
               {"target", "_blank"}], ["15 бел. руб."]}]}]}
        ]

  @formatted_game """
                  #{@domain} <a href=\"http://bobr.en.cx/GameDetails.aspx?gid=55744\">ЦвеТочки</a>
                  [16 июля 2016 г. 18:00:00] - 15 бел. руб.
                  """

  def domain, do: @domain
  def html_game_row, do: @html_game_row
  def formatted_game, do: @formatted_game
end
