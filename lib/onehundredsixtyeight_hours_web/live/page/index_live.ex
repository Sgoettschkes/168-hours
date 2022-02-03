defmodule OnehundredsixtyeightHoursWeb.Page.IndexLive do
  use Phoenix.LiveView

  def render(assigns) do
    OnehundredsixtyeightHoursWeb.PageView.render("index.html", assigns)
  end

  def mount(_params, _, socket) do
    data = OnehundredsixtyeightHours.Csv.run()

    {:ok, assign(socket, %{data: data})}
  end
end
