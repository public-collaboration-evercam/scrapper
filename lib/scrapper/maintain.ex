defmodule Scrapper.Maintain do
  require Logger
  require IEx

  def propose_data(page_number) do
    data_controller = System.get_env["DATA_CTRL"]
    case HTTPoison.get("#{data_controller}#{page_number}", [], []) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Floki.find(".thumbnail-item__img")
        |> Enum.map(fn(class_data) ->
          %{
            title: class_data |> Floki.attribute("title") |> List.first,
            src: class_data |> Floki.attribute("src") |> List.first
          }
        end)
      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.debug "We hit an error which was #{reason}"
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        Logger.debug "We hit an error!"
    end
  end
end