defmodule Enbot.Poller do
  use GenServer
  require Logger
  alias Enbot.Message

  @moduledoc """
  Polls new data from Telegram and removes
  duplicates
  """

  def poll do
    do_poll(0)
  end

  defp do_poll(offset) do
    {:ok, updates} = Nadia.get_updates([offset: offset])
    new_offset = Message.get_last_update_id(updates) + 1
    messages = Message.compact(updates)

    messages
    |> inspect
    |> Logger.info()

    Process.sleep(2000)
    do_poll(new_offset)
  end
end
