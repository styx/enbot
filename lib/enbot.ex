defmodule Enbot do
  use Application
  require Logger

  @moduledoc """
  Enbot provides infromation from en.cx
  """

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Task.Supervisor, [[name: __MODULE__.TaskSupervisor, restart: :permanent]]),
    ]
    opts = [name: __MODULE__.Supervisor, strategy: :one_for_one]

    Logger.info "Starting main Supervisor ..."
    {:ok, spid} = Supervisor.start_link(children, opts)

    Logger.info "Starting Poller ..."
    Task.Supervisor.start_child(__MODULE__.TaskSupervisor, Enbot.Poller, :poll, [])

    Logger.info "Init finished!"
    {:ok, spid}
  end
end
