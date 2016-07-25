defmodule Study.PageController do
  use Study.Web, :controller

  def index(conn, _) do
    params = Study.Counter.get_state
    call_inc(Study.Counter)

    render(conn, "index.html", params)
  end

  defp call_inc(process_name) do
    process_name.inc
  end

  defp redirect_to_top(conn) do
    url = page_path(conn, :index)
    redirect(conn, to: url)
  end

  def kill(conn, _) do
    Study.Counter.kill()
    redirect_to_top(conn)
  end

  def exit(conn, _) do
    Study.Counter.exit()
    redirect_to_top(conn)
  end
end
