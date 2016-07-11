defmodule Enbot.Responder do
  require Logger
  alias Enbot.Actions

  @moduledoc """
  Resolves message to the end functions
  and sends reply to the chat
  """

  def reply(%Nadia.Model.Update{
    message: %Nadia.Model.Message{
      chat: %Nadia.Model.Chat{id: chat_id},
      text: text}})
  do
    text
    |> Logger.info

    Nadia.send_message(chat_id, text |> perform,
      [disable_web_page_preview: true, parse_mode: :HTML, disable_notification: true])
  end

  def reply(_), do: nil

  defp perform(text) do
    case text do
      "/games" ->
        Actions.fetch_games
      "/естькакиеигры" ->
        Actions.fetch_games
      "/help" ->
        Actions.help
      _ ->
        nil
    end
  end
end
