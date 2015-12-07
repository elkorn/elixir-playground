defmodule HelloPhoenix.Router do
  use HelloPhoenix.Web, :router

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

  scope "/", HelloPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    # Sets up a standard CRUD range of API endpoints - check `mix phoenix.routes`.
    resources "users", UserController do
      resources "posts", PostController, only: [:index, :show, :new]
    end
    resources "comments", CommentController, except: [:delete]

    resources "/reviews", ReviewController
  end

  # `as` is used to differentiate path helpers from the ones for normal review resources.
  scope "/admin", as: :admin do
    pipe_through :browser

    resources "/reviews", HelloPhoenix.Admin.ReviewController
  end

  # Other scopes may use custom stacks.
  # scope "/api", HelloPhoenix do
  #   pipe_through :api
  # end
end
