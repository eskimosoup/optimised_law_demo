# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150918112156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_categories", force: :cascade do |t|
    t.string   "name",                         null: false
    t.string   "slug"
    t.string   "suggested_url"
    t.boolean  "display",       default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "articles", force: :cascade do |t|
    t.integer  "article_category_id"
    t.string   "title",                              null: false
    t.text     "summary"
    t.string   "image"
    t.text     "content",                            null: false
    t.date     "date",                               null: false
    t.string   "slug"
    t.string   "suggested_url"
    t.boolean  "display",             default: true
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "team_member_id"
    t.integer  "service_id"
  end

  add_index "articles", ["article_category_id"], name: "index_articles_on_article_category_id", using: :btree
  add_index "articles", ["service_id"], name: "index_articles_on_service_id", using: :btree
  add_index "articles", ["team_member_id"], name: "index_articles_on_team_member_id", using: :btree

  create_table "awards", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "link"
    t.string   "image"
    t.string   "award_type"
    t.boolean  "display",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "business_partners", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "link"
    t.string   "image"
    t.boolean  "display",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name",                         null: false
    t.string   "image"
    t.text     "summary"
    t.text     "content"
    t.string   "layout"
    t.string   "slug"
    t.string   "suggested_url"
    t.boolean  "display",       default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "sub_heading"
    t.integer  "position"
  end

  create_table "event_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "display",    default: true
  end

  create_table "event_locations", force: :cascade do |t|
    t.string   "name"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "town"
    t.string   "region"
    t.string   "postcode"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "display",        default: true
  end

  create_table "events", force: :cascade do |t|
    t.integer  "event_category_id"
    t.integer  "event_location_id"
    t.string   "title"
    t.text     "summary"
    t.string   "image"
    t.text     "content"
    t.datetime "start_date_time"
    t.datetime "end_date_time"
    t.string   "booking_link"
    t.string   "booking_information"
    t.boolean  "display",             default: true
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "slug"
    t.string   "suggested_url"
  end

  add_index "events", ["event_category_id"], name: "index_events_on_event_category_id", using: :btree
  add_index "events", ["event_location_id"], name: "index_events_on_event_location_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "office_locations", force: :cascade do |t|
    t.string   "name",                         null: false
    t.string   "slug"
    t.string   "suggested_url"
    t.boolean  "display",       default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "offices", force: :cascade do |t|
    t.string   "name",                              null: false
    t.string   "building_name"
    t.string   "building_number"
    t.string   "street"
    t.string   "town"
    t.string   "county"
    t.string   "postcode",                          null: false
    t.string   "phone_number"
    t.string   "fax_number"
    t.string   "email"
    t.string   "dx_number"
    t.string   "image"
    t.text     "details"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "display",            default: true
    t.integer  "office_location_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "offices", ["office_location_id"], name: "index_offices_on_office_location_id", using: :btree

  create_table "optimadmin_administrators", force: :cascade do |t|
    t.string   "username",               null: false
    t.string   "email",                  null: false
    t.string   "role",                   null: false
    t.string   "auth_token"
    t.string   "password_digest",        null: false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "optimadmin_administrators", ["auth_token"], name: "index_optimadmin_administrators_on_auth_token", using: :btree
  add_index "optimadmin_administrators", ["email"], name: "index_optimadmin_administrators_on_email", using: :btree
  add_index "optimadmin_administrators", ["username"], name: "index_optimadmin_administrators_on_username", using: :btree

  create_table "optimadmin_documents", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "document",    null: false
    t.string   "module_name"
    t.integer  "module_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "optimadmin_external_links", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "optimadmin_images", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "image",       null: false
    t.string   "module_name"
    t.integer  "module_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "optimadmin_links", force: :cascade do |t|
    t.string   "menu_resource_type"
    t.integer  "menu_resource_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "optimadmin_menu_item_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "optimadmin_menu_item_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "menu_item_anc_desc_idx", unique: true, using: :btree
  add_index "optimadmin_menu_item_hierarchies", ["descendant_id"], name: "menu_item_desc_idx", using: :btree

  create_table "optimadmin_menu_items", force: :cascade do |t|
    t.string   "menu_name",       limit: 100
    t.string   "name",            limit: 100
    t.integer  "parent_id"
    t.boolean  "deletable",                   default: true
    t.boolean  "new_window",                  default: false
    t.string   "title_attribute", limit: 100
    t.integer  "position",                    default: 0
    t.integer  "link_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "optimadmin_menu_items", ["link_id"], name: "index_optimadmin_menu_items_on_link_id", using: :btree

  create_table "optimadmin_module_pages", force: :cascade do |t|
    t.string   "name"
    t.string   "route"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "optimadmin_site_settings", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.string "environment"
  end

  create_table "service_categories", force: :cascade do |t|
    t.integer  "department_id"
    t.string   "name",                         null: false
    t.text     "summary"
    t.string   "image"
    t.string   "slug"
    t.string   "suggested_url"
    t.boolean  "display",       default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "sub_heading"
  end

  add_index "service_categories", ["department_id"], name: "index_service_categories_on_department_id", using: :btree
  add_index "service_categories", ["slug"], name: "index_service_categories_on_slug", using: :btree

  create_table "service_events", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "service_events", ["event_id"], name: "index_service_events_on_event_id", using: :btree
  add_index "service_events", ["service_id"], name: "index_service_events_on_service_id", using: :btree

  create_table "service_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "service_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "service_anc_desc_idx", unique: true, using: :btree
  add_index "service_hierarchies", ["descendant_id"], name: "service_desc_idx", using: :btree

  create_table "service_offices", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "service_offices", ["office_id"], name: "index_service_offices_on_office_id", using: :btree
  add_index "service_offices", ["service_id"], name: "index_service_offices_on_service_id", using: :btree

  create_table "service_related_services", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "related_service_id"
    t.integer  "position"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "service_related_services", ["related_service_id"], name: "index_service_related_services_on_related_service_id", using: :btree
  add_index "service_related_services", ["service_id"], name: "index_service_related_services_on_service_id", using: :btree

  create_table "service_team_members", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "team_member_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "service_team_members", ["service_id"], name: "index_service_team_members_on_service_id", using: :btree
  add_index "service_team_members", ["team_member_id"], name: "index_service_team_members_on_team_member_id", using: :btree

  create_table "service_testimonials", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "testimonial_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "service_testimonials", ["service_id"], name: "index_service_testimonials_on_service_id", using: :btree
  add_index "service_testimonials", ["testimonial_id"], name: "index_service_testimonials_on_testimonial_id", using: :btree

  create_table "service_videos", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "service_videos", ["service_id"], name: "index_service_videos_on_service_id", using: :btree
  add_index "service_videos", ["video_id"], name: "index_service_videos_on_video_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.integer  "service_category_id"
    t.integer  "parent_id"
    t.string   "name",                               null: false
    t.string   "image"
    t.text     "summary"
    t.string   "slug"
    t.string   "suggested_url"
    t.boolean  "display",             default: true
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.text     "content"
  end

  add_index "services", ["service_category_id"], name: "index_services_on_service_category_id", using: :btree
  add_index "services", ["slug"], name: "index_services_on_slug", using: :btree

  create_table "team_member_events", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "team_member_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "team_member_events", ["event_id"], name: "index_team_member_events_on_event_id", using: :btree
  add_index "team_member_events", ["team_member_id"], name: "index_team_member_events_on_team_member_id", using: :btree

  create_table "team_member_roles", force: :cascade do |t|
    t.string   "name",                      null: false
    t.integer  "position",   default: 0
    t.boolean  "display",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "team_member_testimonials", force: :cascade do |t|
    t.integer  "team_member_id"
    t.integer  "testimonial_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "team_member_testimonials", ["team_member_id"], name: "index_team_member_testimonials_on_team_member_id", using: :btree
  add_index "team_member_testimonials", ["testimonial_id"], name: "index_team_member_testimonials_on_testimonial_id", using: :btree

  create_table "team_members", force: :cascade do |t|
    t.string   "forename",                              null: false
    t.string   "surname",                               null: false
    t.string   "image"
    t.integer  "team_member_role_id"
    t.string   "email"
    t.string   "primary_phone_number"
    t.string   "secondary_phone_number"
    t.string   "mobile_phone_number"
    t.string   "google_plus"
    t.string   "twitter"
    t.string   "linkedin"
    t.text     "biography"
    t.string   "suggested_url"
    t.string   "slug"
    t.boolean  "display",                default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "team_members", ["team_member_role_id"], name: "index_team_members_on_team_member_role_id", using: :btree

  create_table "testimonials", force: :cascade do |t|
    t.string   "author"
    t.string   "author_company"
    t.text     "recommendation",                null: false
    t.integer  "position",       default: 0
    t.boolean  "display",        default: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "video_categories", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "display",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string   "name",                              null: false
    t.text     "youtube_embed_code",                null: false
    t.boolean  "display",            default: true
    t.integer  "video_category_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "image"
    t.text     "summary"
  end

  add_index "videos", ["video_category_id"], name: "index_videos_on_video_category_id", using: :btree

  add_foreign_key "articles", "article_categories"
  add_foreign_key "articles", "team_members"
  add_foreign_key "events", "event_categories"
  add_foreign_key "events", "event_locations"
  add_foreign_key "offices", "office_locations"
  add_foreign_key "service_categories", "departments"
  add_foreign_key "service_events", "events"
  add_foreign_key "service_events", "services"
  add_foreign_key "service_offices", "offices"
  add_foreign_key "service_offices", "services"
  add_foreign_key "service_related_services", "services"
  add_foreign_key "service_related_services", "services", column: "related_service_id"
  add_foreign_key "service_team_members", "services"
  add_foreign_key "service_team_members", "team_members"
  add_foreign_key "service_testimonials", "services"
  add_foreign_key "service_testimonials", "testimonials"
  add_foreign_key "service_videos", "services"
  add_foreign_key "service_videos", "videos"
  add_foreign_key "services", "service_categories"
  add_foreign_key "team_member_events", "events"
  add_foreign_key "team_member_events", "team_members"
  add_foreign_key "team_member_testimonials", "team_members"
  add_foreign_key "team_member_testimonials", "testimonials"
  add_foreign_key "team_members", "team_member_roles"
  add_foreign_key "videos", "video_categories"
end
