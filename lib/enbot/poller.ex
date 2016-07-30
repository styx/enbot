defmodule Enbot.Poller do
  use GenServer
  require Logger
  alias Enbot.Message

  @moduledoc """
  Polls new data from Telegram and removes
  duplicates
  """

  def poll do
    Logger.info "Starting Poller ..."
    do_poll(0)
  end

  defp do_poll(offset) do
    new_offset =
      case Nadia.get_updates([offset: offset]) do
        {:ok, updates} ->
          process_updates(updates)
        {:error, error} ->
          error |> inspect |> Logger.error
          Process.sleep(5000)
          offset
      end

    Process.sleep(1000)
    do_poll(new_offset)
  end

  defp process_updates(updates) do
    new_offset = Message.get_last_update_id(updates) + 1

    Message.compact(updates)
    |> Enum.each(&reply/1)

    new_offset
  end

  defp reply(message) do
    if Mix.env == :dev do
      message
      |> inspect
      |> Logger.info
    end
    Task.start(Enbot.Responder, :reply, [message])
  end
end
