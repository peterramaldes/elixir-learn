defmodule Chain do
  defstruct(next_node: nil, count: 4)

  def start_link(next_node) do
    spawn_link(__MODULE__, :message_loop, [ %__MODULE__{next_node: next_node} ])
    |> Process.register(:chainer)
  end

  def message_loop(%{count: 0}) do
    IO.puts "DONE"
  end

  def message_loop(state) do
    receive do
      {:trigger, list} ->
        IO.inspect list
        :timer.sleep 500 # Sleep 500 ms
        send {:chainer, state.next_node}, {:trigger, [node() | list]}
    end
    message_loop(%{state | count: state.count - 1})
  end
end
