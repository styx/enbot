defmodule Enbot.Message do
  alias Nadia.Model

  @moduledoc """
  Helpers to prepare messages for answering
  """

  def get_last_update_id([]), do: 0
  def get_last_update_id(list) do
    %Nadia.Model.Update{update_id: latest_update_id} = List.last(list)
    latest_update_id
  end

  def compact([]), do: []
  def compact(list) do
    list
    |> Stream.filter(&filter_useless/1)
    |> Enum.to_list
    |> Enum.uniq_by(&filter_duplicates/1)
  end

  defp filter_useless(%Nadia.Model.Update{message: message}) do
    !is_nil(message)
  end

  defp filter_duplicates(
    %Nadia.Model.Update{
      message: %Nadia.Model.Message{
        chat: %Nadia.Model.Chat{id: id}, text: text
      }
    }
  ) do
    "#{id}#{text}"
  end

end
