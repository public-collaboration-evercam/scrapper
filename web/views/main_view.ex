defmodule Scrapper.MainView do
  use Scrapper.Web, :view

  def render("show.json", %{data: data}) do
    %{
      data: Enum.map(data, fn(d) ->
        %{
          image_src: d.src,
          camera_name: d.title
        }
      end)
    }
  end
end
