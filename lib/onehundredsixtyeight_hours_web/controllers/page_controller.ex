defmodule OnehundredsixtyeightHoursWeb.PageController do
  use OnehundredsixtyeightHoursWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
