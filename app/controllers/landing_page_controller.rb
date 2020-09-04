class LandingPageController < ApplicationController
  def index
    @services = Service.all
    @beta_user = BetaUser.new
  end

  def thanks; end

  def create
    @beta_user = BetaUser.new(params.require(:beta_user).permit(:name, :email, :phone, :messaging_service, :service_of_interest))
    if @beta_user.save
      redirect_to landing_page_thanks
    else
      render :index
    end
  end
end
