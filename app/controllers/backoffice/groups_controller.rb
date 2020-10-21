class Backoffice::GroupsController < BackofficeController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :get_service, only: %i[new edit]

  def index
    @groups = Group.all
  end

  def show; end

  def new
    @group = Group.new
    @group.build_leader_group
  end

  def create
    @group = Group.new(params_group)
    if @group.save
      redirect_to backoffice_groups_path
    else
      redirect_to dashboard_path
    end
  end

  def edit; end

  def update
    if @group.update(params_group)
      redirect_to groups
    else
      render :edit
    end
  end

  def destroy
    if @group.destroy
      redirect_to groups
    else
      render :index
    end
  end

  private

  def get_service
    @service = Service.all
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def params_group
    params.require(:group).permit(:title, :description, :service_id, :value, leader_group_attributes: %i[id beta_user_id _destroy], member_groups_attributes: %i[id beta_user_id _destroy])
  end
end
