defmodule Cru.PageController do
  use Cru.Web, :controller


  def index(conn, _params) do
    slides = Repo.all(Cru.Slide)
    services = Repo.all(Cru.Service)
    render conn, "index.html", slides: slides, services: services
  end
end
