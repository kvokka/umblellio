class RatesController < ApplicationController
  respond_to :json

  def create
    @rate = Rate.new(rate_params)
    render(nothing: true) unless @blogpost = Blogpost.find(params[:blogpost_id])
    @rate.blogpost_id = @blogpost.id
    if @rate.save
      render json:  @blogpost&.rating
    else
      render nothing: true
    end
  end

  private

    def rate_params
      params.require(:rates).permit(:rating)
    end
end
