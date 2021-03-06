# Single Product

This module sets up Stripe for a single electronic product - e.g. a paywalled blog. 

## Implementation

### phx_gen_auth

The user model is created using the [phx_gen_auth library](https://github.com/aaronrenner/phx_gen_auth).

We are adding another field in the user model callled 'role', which takes three values - 'admin', 'customer', 'guest'. 

The default is 'guest' after signup. 'Admin' is assigned through the DB and 'admin' user can create blog posts. 'Guest' is upgraded to 'customer' after payment. 'Customer' is allowed to read blog post after login, while 'guest is not.

### Adding the 'post' model

~~~~~~~
mix phx.gen.html Blog Post posts title:string body:string
~~~~~~~

### Payment Setup

We wrote functions "SingleProduct.Payment.subscribe" and "SingleProduct.Payment.unsubscribe" to toggle the roles between "guest" and "customer" based on Stripe payments. These functions are invoked by the Payment controller that interacts with Stripe.

### Redirection

Additionally, we created authorization logic so that the customer, after payment, goes back to the link he intended to see. This is done by passing a hidden parameter to the payment form (not Stripe part). That hidden parameter comes back to the "create" function after payment and can be used to create redirection.


### Authorization Setup

The function "authorize" contains various permissions for "admin", "guest" and "customer". Only the "show" function needs to adjust to different kinds of users. The others are only used by "admin".


## Default Instructions

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
