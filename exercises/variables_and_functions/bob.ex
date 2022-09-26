defmodule Bob do
  def print do
    traveled = 200
    time_in_hours = 4

    IO.puts(
      "Bob traveled #{traveled} km in #{time_in_hours} hours in #{traveled / time_in_hours} velocity "
    )
  end
end
