defmodule SingleProduct.Payment do
  @moduledoc """
  The Payment context.
  """

  import Ecto.Query, warn: false
  alias SingleProduct.Repo
  alias SingleProduct.Accounts.User

  def subscribe(%User{} = user) do
    user
    |> Ecto.Changeset.change(%{role: "customer"})
    |> Repo.update()
  end

  def unsubscribe(%User{} = user) do
    user
    |> Ecto.Changeset.change(%{role: "guest"})
    |> Repo.update()
  end
end
