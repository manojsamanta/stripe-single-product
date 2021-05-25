defmodule SingleProductWeb.Authorizer do

  alias SingleProduct.Accounts.User
  alias SingleProduct.Blog.Post
  alias SingleProductWeb.PaymentController

  def authorize(:show, %Post{} = post, %User{}=user) do
    case user.role do
      "admin"  -> :ok
      "customer"  -> :ok
      "guest" -> {:route, post}
    end
  end

  def authorize(:admin, %Post{} = _post, %User{}=user) do
    if user.role== "admin" do
      :ok 
    else
      {:error, :unauthorized}
    end
  end

end
