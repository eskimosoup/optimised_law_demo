module Optimadmin
  class TeamMemberPresenter < Optimadmin::BasePresenter
    presents :team_member

    def id
      team_member.id
    end

    def title
      "#{team_member.forename} #{team_member.surname}"
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.raw team_member.biography
    end
  end
end
