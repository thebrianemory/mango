defmodule MangoWeb.Router do
  use MangoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :frontend do
    plug MangoWeb.Plugs.LoadCustomer
    plug MangoWeb.Plugs.FetchCart
  end

  scope "/", MangoWeb do
    pipe_through [:browser, :frontend]
    get "/register", RegistrationController, :new
    post "/register", RegistrationController, :create
    get "/login", SessionController, :new
    post "/login", SessionController, :create

    get "/", PageController, :index
    get "/categories/:name", CategoryController, :show

    get "/cart", CartController, :show
    post "/cart", CartController, :add
    patch "/cart", CartController, :update
    put "/cart", CartController, :update
  end

  scope "/", MangoWeb do
    pipe_through [:browser, :frontend, MangoWeb.Plugs.AuthenticateCustomer]

    get "/logout", SessionController, :delete
    get "/checkout", CheckoutController, :edit
    put "/checkout/confirm", CheckoutController, :update
  end
end
