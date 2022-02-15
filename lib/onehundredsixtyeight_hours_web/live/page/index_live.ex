defmodule OnehundredsixtyeightHoursWeb.Page.IndexLive do
  use Phoenix.LiveView

  def render(assigns) do
    OnehundredsixtyeightHoursWeb.PageView.render("index.html", assigns)
  end

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:data, [])
     |> allow_upload(:timesheet, accept: ~w(.csv))}
  end

  def handle_event("validate", _params, socket) do
    {:noreply, socket}
  end

  def handle_event("save", _params, socket) do
    uploaded_files =
      consume_uploaded_entries(socket, :timesheet, fn %{path: path}, _entry ->
        {:ok,
         File.stream!(path)
         |> OnehundredsixtyeightHours.Csv.parse()
         |> OnehundredsixtyeightHours.Csv.calculate_minutes()}
      end)

    data = List.first(uploaded_files)

    {:noreply,
     socket
     |> update(:data, fn _ -> data end)}
  end
end
