defmodule MangoWeb.SessionController do
  use MangoWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end
end
