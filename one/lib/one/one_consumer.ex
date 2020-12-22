defmodule PubSubDemo.OneConsumer do
  use GenServer

  @pubsub Phoenix.PubSubTest
  @topic "one"

  def start_link() do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def get() do
    GenServer.call(__MODULE__, :get)
  end

  def init(_) do
    Phoenix.PubSub.subscribe(@pubsub, @topic)
    {:ok, []}
  end

  def handle_call(:get, _, state) do
    {:reply, state, state}
  end

  def handle_info({:message, message}, state) do
    IO.puts("Message received #{message}")

    updated_state = [message | state ]

    {:noreply, updated_state}
  end
end
