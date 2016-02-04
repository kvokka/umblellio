class RatesController < ApplicationController
  respond_to :json

  def create
    @rate = Rate.new(rate_params)
    @blogpost = Blogpost.find params[:blogpost_id]
    @blogpost&.update_rating!(@rate.rating)
    render json:  @blogpost&.rating
  end

  private

    def rate_params
      params.require(:rates).permit(:rating)
    end
end
