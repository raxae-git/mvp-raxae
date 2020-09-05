class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  def show; end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params_group)
    if @group.save
      redirect_to landing_page_thanks
    else
      redirect_to root
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

  def set_group
    @group = Group.find(params[:id])
  end

  def params_group
    params.permit(:title, :description, :service)
  end
end
