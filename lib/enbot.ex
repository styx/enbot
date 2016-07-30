defmodule Enbot do
  use Application
  require Logger

  @moduledoc """
  Enbot provides infromation from en.cx
  """

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(Task, [&Enbot.Poller.poll/0], restart: :permanent),
      supervisor(Task.Supervisor, [[name: __MODULE__.TaskSupervisor, restart: :permanent]]),
    ]
    opts = [name: __MODULE__.Supervisor, strategy: :one_for_one]

    Logger.info "Starting main Supervisor ..."
    {:ok, spid} = Supervisor.start_link(children, opts)

    Logger.info "Init finished!"
    {:ok, spid}
  end
end
