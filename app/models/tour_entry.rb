class TourEntry < ActiveRecord::Base
  validates :page, :page_area, :title, :content, presence: true
  validates :page_area, uniqueness: { scope: :page }

  scope :area, -> (page) { where(page: page) if page.present? }
  scope :displayed, -> { where(display: true) }
  scope :positioned, -> { order(:position) }

  PAGE_AREA =  [
                ['Home',
                  [
                    ['Navigation', 'navigation'],
                    ['Audiences', 'audiences'],
                    ['Testimonials', 'testimonials'],
                    ['Articles', 'articles'],
                    ['Partners', 'partners'],
                  ]
                  ],
                ['Department',
                  [
                    ['Introduction', 'introduction'],
                    ['Services', 'services'],
                    ['Team Members', 'team-members-link'],
                    ['Call to Action', 'call-to-actions'],
                  ],
                ],
                ['Service',
                  [
                    ['Sidebar Links', 'sidebar-links'],
                    ['Call to Action', 'call-to-actions'],
                    ['Case Studies', 'case-studies'],
                    ['Activity Stream', 'activity-stream'],
                    ['Testimonials', 'testimonials'],
                    ['Twitter', 'twitter'],
                    ['Downloads', 'downloads'],
                    ['People Helped', 'people-helped'],
                    ['Video', 'videos'],
                    ['Team Members', 'team-members-carousel'],
                    ['Awards', 'awards'],
                    ['Events', 'events'],
                  ],
                ]
              ]

  # validates :page_area, inclusion: TourEntry::PAGE_AREA

  def page_title
    klass = Module.const_get(self.page.split('_').first)
    return klass.find(self.page.split('_').last.to_i).name || klass.find(self.page.split('_').last.to_i).title
  rescue NameError
    return self.page
  end
end
