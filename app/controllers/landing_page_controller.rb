class LandingPageController < ApplicationController
  layout 'landing_page'
  before_action :get_count, only: %i[index create]

  def index
    @services = Service.all
    @beta_user = BetaUser.new
  end

  def thanks; end

  def terms; end

  def privacy_policies; end

  def create
    if (@count.blank? != true) && @count >= 200
      send_leads
    else
      @beta_user = BetaUser.new(beta_users_params)
      if @beta_user.save
        redirect_to landing_page_thanks_path if find_or_send_new_service(@beta_user.service_of_interest)
      else
        render :index
      end
    end
  end

  private

  def get_count
    @count = CountUser.first.beta_users_count
  end

  def send_leads
    leads = beta_users_params
    LeadMailer.confirmation(leads).deliver_later!
    redirect_to root_path
  end

  def beta_users_params
    params.require(:beta_user).permit(:name, :email, :phone, :messaging_service, :service_of_interest)
  end

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
