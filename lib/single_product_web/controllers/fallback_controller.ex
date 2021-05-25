defmodule SingleProductWeb.FallbackController do
  use Phoenix.Controller
  alias SingleProductWeb.Router.Helpers, as: Routes

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(SingleProductWeb.ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(403)
    |> put_view(SingleProductWeb.ErrorView)
    |> render(:"403")
  end

  def call(conn, {:route, post}) do
	IO.inspect post
    redirect(conn, to: Routes.payment_path(conn, :new, %{id: post.id}))
  end

  def call(conn, {:error, _}) do
    conn
    |> put_status(:not_found)
    |> put_view(SingleProductWeb.ErrorView)
    |> render(:"404")
  end

end
