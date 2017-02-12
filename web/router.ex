defmodule Scrapper.Router do
  use Scrapper.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Scrapper do
    pipe_through :api
  end
end
