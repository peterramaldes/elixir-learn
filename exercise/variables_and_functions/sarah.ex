defmodule Sarah do
  @market Map.new([{:bread_price, 0.10}, {:milk_price, 2.00}, {:cake_price, 15.00}])

  def expression(bread, milk, cake) do
    calc(:bread_price, bread) + calc(:milk_price, milk) + calc(:cake_price, cake)
  end

  defp calc(key, quantity), do: Map.get(@market, key) * quantity
end
