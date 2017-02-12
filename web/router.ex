defmodule Scrapper.Router do
  use Scrapper.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Scrapper do
    pipe_through :api

    post "/cameras/axis", MainController, :index
  end
end
