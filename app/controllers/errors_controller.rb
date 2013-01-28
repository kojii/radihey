class ErrorsController < ApplicationController
  def error_404
    respond_to do |format|
      format.html
      format.css {render :text => '', status: 404}
    end
  end

  def error_500
  end
end
