module Optimadmin
  class TeamMember::RolesController < Optimadmin::ApplicationController
    before_action :set_team_member_role, only: [:show, :edit, :update, :destroy]

    def index
      @team_member_roles = Optimadmin::BaseCollectionPresenter.new(collection: TeamMember::Role.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::TeamMember::RolePresenter)
    end

    def show
    end

    def new
      @team_member_role = TeamMember::Role.new
    end

    def edit
    end

    def create
      @team_member_role = TeamMember::Role.new(team_member_role_params)
      if @team_member_role.save
        redirect_to team_member_roles_url, notice: 'Role was successfully created.'
      else
        render :new
      end
    end

    def update
      if @team_member_role.update(team_member_role_params)
        redirect_to team_member_roles_url, notice: 'Role was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @team_member_role.destroy
      redirect_to team_member_roles_url, notice: 'Role was successfully destroyed.'
    end

  private


    def set_team_member_role
      @team_member_role = TeamMember::Role.find(params[:id])
    end

    def team_member_role_params
      params.require(:team_member_role).permit(:name, :position, :display)
    end
  end
end
