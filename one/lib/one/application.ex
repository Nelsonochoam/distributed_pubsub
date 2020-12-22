defmodule One.Application do


  use Application

  def start(_type, _args) do
    children = [
      { Phoenix.PubSub, name: Phoenix.PubSubTest, pool_size: 1, adapter: Phoenix.PubSub.PG2 },
    ]

    opts = [strategy: :one_for_one, name: One.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
