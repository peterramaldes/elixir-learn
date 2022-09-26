defmodule MatchStickFactory do
  @big 50
  @medium 20
  @small 5

  def boxes(matchsticks) do
    r_big = rem(matchsticks, @big)
    r_medium = rem(r_big, @medium)
    r_small = rem(r_medium, @small)

    %{
      big: div(matchsticks, @big),
      medium: div(r_big, @medium),
      small: div(r_medium, @small),
      remaining_matchsticks: r_small
    }
  end
end
