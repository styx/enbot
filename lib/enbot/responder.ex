defmodule Enbot.Responder do
  require Logger
  alias Enbot.Actions

  @moduledoc """
  Resolves message to the end functions
  and sends reply to the chat
  """

  @bot_name "denominated_en_bot"

  def preformat_message(text) do
    String.split(text, "@")
  end

  def reply(%Nadia.Model.Update{
    message: %Nadia.Model.Message{
      chat: %Nadia.Model.Chat{id: chat_id, type: type},
      text: text}})
  do
    text
    |> Logger.info

    Nadia.send_message(chat_id, text |> preformat_message |> perform(type),
      [disable_web_page_preview: true, parse_mode: :HTML, disable_notification: true])
  end

  def reply(_), do: nil

  defp perform([message], "private"), do: process_message(message)
  defp perform([message], "group"), do: process_message(message)
  defp perform([text, chat], "group") do
    if chat == @bot_name do
      process_message(text)
    end
  end

  defp perform(_, _), do: nil

  defp process_message(message) do
    case message do
      "/games" ->
        Actions.fetch_games
      "/help" ->
        Actions.help
      "/start" ->
        Actions.help
      _ ->
        nil
    end
  end
end
