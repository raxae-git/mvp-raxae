class LandingPageController < ApplicationController
  layout 'landing_page'
  def index
    @services = Service.all
    @beta_user = BetaUser.new
    @count = CountUser.first.beta_users_count
  end

  def thanks; end

  def create
    @beta_user = BetaUser.new(params.require(:beta_user).permit(:name, :email, :phone, :messaging_service, :service_of_interest))
    if @beta_user.save
      redirect_to landing_page_thanks_path if find_or_send_new_service(@beta_user.service_of_interest)
    else
      render :index
    end
  end

  private

  def find_or_send_new_service(title_service)
    if find_service(title_service).blank?
      send_service(title_service)
    else
      true
    end
  end

  def find_service(title_service)
    Service.where('title LIKE ?', "%#{title_service}%")
  end

  def send_service(title_service)
    if ServiceMailer.new_service(title_service).deliver_later!
      true
    else
      false
    end
  end
end
