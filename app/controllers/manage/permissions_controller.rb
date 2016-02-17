class Manage::PermissionsController < Manage::ApplicationController

  def index
    @permissions = PermissionsSearcher.new(current_user, params).results
  end

  def new
    @permission = Permission.new
  end

  def create
    @permission = Permission.new(params[:permission])
    if @permission.save
      redirect_to manage_permissions_path
    else
      render :new
    end
  end

  def destroy
    Permission.find(params[:id]).destroy
    redirect_to manage_permissions_path
  end

end
