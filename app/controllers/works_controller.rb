class WorksController < ApplicationController

  def index
    @works = Work.chronological
    @info = Info.last
  end

end