class OfficePresenter < BasePresenter
  presents :office

  delegate :name, :building_name, :building_number, :street, :town, :county, :postcode, :fax_number, :dx_number,
           :phone_number, :office_location_name, to: :office

  def email
    h.mail_to office.email if office.email
  end

  def details
    h.raw office.details if office.details
  end

  def address
    [building_name, building_number, street, town, county, postcode].reject{|x| x.blank?}.join(' ')
  end

  def linked_name
    begin
      h.link_to name, office, title: name
    rescue
      h.link_to name, '#', title: name, class: 'invalid-link'
    end
  end
end
