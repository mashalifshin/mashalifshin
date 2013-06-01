class AboutController < ApplicationController
  
  def index
    @info = Info.last
  end
  
end