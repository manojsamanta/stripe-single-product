defmodule SingleProductWeb.PageController do
  use SingleProductWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
