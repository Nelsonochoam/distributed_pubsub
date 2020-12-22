defmodule PubSubDemo.TwoPublisher do

  @doc """
   App two publishes to the app one topic
  """
  @pubsub_name Phoenix.PubSubTest
  @pubsub_topic "one"

  def publish(message) when is_binary(message) do
    Phoenix.PubSub.broadcast(@pubsub_name, @pubsub_topic, { :message, message })
  end

end
