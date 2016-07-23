defmodule Study.PageController do
  use Study.Web, :controller

  def index(conn, _) do

    params = %{
      last_message: "ラスト",
      count: 100,
    }

    render(conn, "index.html", params)
  end
end
