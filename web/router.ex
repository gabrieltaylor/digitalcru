defmodule Cru.Router do
  use Cru.Web, :router

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

  scope "/", Cru do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/admin", Cru.Admin, as: :admin do
    pipe_through :browser

    get "/dashboard", DashboardController, :index
    resources "/slides", SlideController
    resources "/services", ServiceController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Cru do
  #   pipe_through :api
  # end
end
