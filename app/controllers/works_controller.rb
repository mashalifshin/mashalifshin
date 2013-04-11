class WorksController < ApplicationController

  def index
    @works = Works.chronological
    @info = Infos.last
  end

end