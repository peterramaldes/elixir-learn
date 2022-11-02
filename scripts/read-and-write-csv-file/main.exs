defmodule Oscar do
  defstruct [:index, :year, :age, :name, :movie]

  def get_oscar_from_csv(csv_filepath) do
    x =
      File.read!(csv_filepath)
      |> String.split("\n")
      |> Enum.map(&String.split(&1, ",", trim: true))

    [_ | tail] = x

    tail
    |> Enum.map(fn [a, b, c, d, e] ->
      %Oscar{
        index: String.trim(a),
        year: String.trim(b),
        age: String.trim(c),
        name: String.replace(String.trim(d), "\"", ""),
        movie: String.replace(String.trim(e), "\"", "")
      }
    end)
  end
end

defmodule Main do
  def main do
    oscar_name =
      IO.gets("What is the name?\n")
      |> String.trim()
      |> String.downcase()

    Oscar.get_oscar_from_csv("assets/oscar_age_male.csv")
    |> Enum.find(fn x -> oscar_name == String.downcase(x.name) end)
    |> IO.inspect()
  end
end

Main.main()
