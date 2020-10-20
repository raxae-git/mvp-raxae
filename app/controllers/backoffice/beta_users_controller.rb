class Backoffice::BetaUsersController < BackofficeController
  before_action :set_beta_user, only: %i[show edit update destroy]

  def index
    @beta_users = BetaUser.all.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show; end

  def new
    @beta_user = BetaUser.new
  end

  def edit; end

  def create
    @beta_user = BetaUser.new(params_beta_user)
    if @beta_user.save
      redirect_to backoffice_beta_users_path
    else
      render :edit
    end
  end

  def update
    if @beta_user.update(params_beta_user)
      redirect_to backoffice_beta_users_path
    else
      render :edit
    end
  end

  def destroy
    if @beta_user.destroy
      redirect_to backoffice_beta_users_path
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
end
