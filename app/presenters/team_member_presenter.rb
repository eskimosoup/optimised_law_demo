class TeamMemberPresenter < BasePresenter
  presents :team_member

  delegate :forename, :surname, :primary_phone_number, :secondary_phone_number, :mobile_phone_number, to: :team_member

  def link
    begin
      h.link_to 'Team Member', team_member
      result = team_member
    rescue
      result = '#invalid-link'
    end

    result
  end

  def name
    [forename, surname].join(" ")
  end

  def email
    h.mail_to team_member.email if team_member.email?
  end

  def role
    team_member.team_member_role_name
  end

  def google_plus
    team_member.google_plus
  end

  def twitter
    team_member.twitter
  end

  def linkedin
    team_member.linkedin
  end

  def biography
    team_member.biography
  end

  def carousel_image
    if team_member.image.present?
      show_image
    else
      h.image_tag 'components/team-members-service-carousel/placeholder.png', alt: name
    end
  end
end
