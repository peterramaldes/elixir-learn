defmodule BigIntegerLiveViewWeb.PageController do
  use BigIntegerLiveViewWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
