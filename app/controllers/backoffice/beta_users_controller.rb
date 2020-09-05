class BetaUsersController < ApplicationController
  before_action :set_beta_user, only: %i[show edit update destroy]

  def index; end

  def show; end

  def new
    @beta_user = BetaUser.new
  end

  def create
    @beta_user = BetaUser.new(params_beta_user)
    if @beta_user.save
      redirect_to landing_page_thanks_path if find_or_create_service(@beta_user.service_of_interest)
    else
      redirect_to root_path
    end
  end

  def edit; end

  def update
    if @beta_user.update(params_beta_user)
      redirect_to beta_users
    else
      render :edit
    end
  end

  def destroy
    if @beta_user.destroy
      redirect_to beta_users
    else
      render :index
    end
  end

  private

  def set_beta_user
    @beta_user = BetaUser.find(params[:id])
  end

  def params_beta_user
    params.require(:beta_user).permit(:name, :email, :phone, :messaging_service, :service_of_interest)
  end

  def find_or_create_service(title_service)
    if find_service(title_service).blank?
      create_service(title_service)
    else
      true
    end
  end

  def find_service(title_service)
    Service.where('title LIKE ?', "%#{title_service}%")
  end

  def create_service(title_service)
    if Service.create(title: title_service)
      true
    else
      false
    end
  end
end
