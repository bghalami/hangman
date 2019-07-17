defmodule PhangmanWeb.Router do
  use PhangmanWeb, :router

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

  scope "/hangman", PhangmanWeb do
    pipe_through :browser

    get "/", HangmanController, :new_game
    post "/", HangmanController, :create_game
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhangmanWeb do
  #   pipe_through :api
  # end
end
