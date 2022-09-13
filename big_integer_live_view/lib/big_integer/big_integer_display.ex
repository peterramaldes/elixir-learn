defmodule BigIntegerLiveViewWeb.Live.BigIntegerDisplay do
  use BigIntegerLiveViewWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, schedule_tick_and_update_assign(socket)}
  end

  def handle_info(:tick, socket) do
    {:noreply, schedule_tick_and_update_assign(socket)}
  end

  defp schedule_tick_and_update_assign(socket) do
    Process.send_after(self(), :tick, 1000)
    assign(socket, :now, :os.system_time(:millisecond))
  end

  def render(assigns) do
    ~L"""
      <h3>Now:</h3>
      <p><%= assigns.now %></p>
    """
  end
end
