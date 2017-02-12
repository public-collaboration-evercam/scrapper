defmodule Scrapper.Router do
  use Scrapper.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug CORSPlug, origin: ["*"]
  end

  scope "/api", Scrapper do
    pipe_through :api

    get "/cameras/axis/:page_number", MainController, :index
  end
end
