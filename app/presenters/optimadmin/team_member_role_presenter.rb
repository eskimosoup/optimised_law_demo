module Optimadmin
  class TeamMemberRolePresenter < Optimadmin::BasePresenter
    presents :team_member_role

    def id
      team_member_role.id
    end

    def title
      #team_member_role.title
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      #h.raw team_member_role.summary
    end
  end
end
