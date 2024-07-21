class ErrorsController < ApplicationController
  def not_found
    @path = params[:path]
    render "404"
  end
end
