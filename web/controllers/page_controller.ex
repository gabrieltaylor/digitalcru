defmodule Cru.PageController do
  use Cru.Web, :controller


  def index(conn, _params) do
    slides = Repo.all(Cru.Slide)
    render conn, "index.html", slides: slides
  end
end
