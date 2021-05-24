defmodule SingleProduct.Repo do
  use Ecto.Repo,
    otp_app: :single_product,
    adapter: Ecto.Adapters.Postgres
end
