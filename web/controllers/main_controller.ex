defmodule Scrapper.MainController do
  use Scrapper.Web, :controller
  alias Scrapper.MainView
  import Scrapper.Maintain, only: [propose_data: 1]
  require IEx

  def index(conn, %{"page_number" => page_number} = _params) do
    data = propose_data(page_number)
    render(conn, MainView, "show.json", %{data: data})
  end
end
