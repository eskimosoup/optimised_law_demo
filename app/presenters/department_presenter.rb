class DepartmentPresenter < BasePresenter
  presents :department

  delegate :name, :slug, to: :department

  def sub_heading
    department.sub_heading
  end

  def summary
    h.raw department.summary
  end

  def index_image
    image(:index)
  end

  def services
    department.services.order(:name)
  end

  def leaflet_download
    h.link_to 'Download a Leaflet', department.leaflet.url if department.leaflet?
  end

  # TODO: Add in tests for these three methods
  def overview_image
    image(:show, alt: name, class: 'hide-for-medium-down')
  end

  def tab_link
    h.link_to department.name, "##{slug}", class: "service-overview-title-block"
  end

  def department_head
    return nil if department.services.blank? || department.services.first.team_members.blank?
    h.link_to h.service_path(department.services.first, anchor: 'team-members-carousel'), class: 'team-members-link', id: 'team-members' do
      h.image_tag department.services.first.team_members.first.image.small, class: 'team-members-service-overview-avatar'
    end
  end
end
