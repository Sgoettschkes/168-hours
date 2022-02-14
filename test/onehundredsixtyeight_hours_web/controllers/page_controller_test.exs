defmodule OnehundredsixtyeightHoursWeb.PageControllerTest do
  use OnehundredsixtyeightHoursWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "168 Hours in pictures"
  end
end
