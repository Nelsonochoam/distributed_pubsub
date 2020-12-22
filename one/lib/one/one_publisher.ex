defmodule PubSubDemo.OnePublisher do

  @doc """
   App one publishes to the app two topic
  """
  @pubsub_name Phoenix.PubSubTest
  @pubsub_topic "two"

  def publish(message) when is_binary(message) do
    Phoenix.PubSub.broadcast(@pubsub_name, @pubsub_topic, { :message, message })
  end

end
