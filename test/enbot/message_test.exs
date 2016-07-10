defmodule Enbot.MessageTest do
  use ExUnit.Case
  doctest Enbot.Message

  test "get_last_update_id" do
    id =
      Fixtures.messages
      |> Enbot.Message.get_last_update_id

    assert id === Fixtures.latest_update_id
  end

  test "compact" do
    len =
      Fixtures.messages
      |> Enbot.Message.compact
      |> length

    assert 4 === len
  end
end
