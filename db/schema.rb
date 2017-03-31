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

ActiveRecord::Schema.define(version: 20170323212347) do

  create_table "badge", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "id",                        null: false
    t.string   "title",                     null: false
    t.string   "image_url",                 null: false
    t.text     "description", limit: 65535, null: false
    t.text     "criteria",    limit: 65535, null: false
    t.text     "data",        limit: 65535, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "badge_projects", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "badge_id",   null: false, unsigned: true
    t.integer  "project_id", null: false, unsigned: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "badge_users", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "code",                           null: false
    t.integer  "badge_id",                       null: false, unsigned: true
    t.integer  "user_id",                        null: false, unsigned: true
    t.integer  "issuer_id",                      null: false, unsigned: true
    t.boolean  "awarded",        default: false, null: false
    t.integer  "evidence_id",                    null: false, unsigned: true
    t.string   "requirements"
    t.datetime "eligibility_dt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "curricula", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "curriculum_projects", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "curriculum_id", null: false, unsigned: true
    t.integer  "project_id",    null: false, unsigned: true
    t.integer  "order",         null: false, unsigned: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["curriculum_id"], name: "curriculum_projects_curriculum_id_foreign", using: :btree
  end

  create_table "evidence", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "group_id",                                 null: false, unsigned: true
    t.integer  "project_id",                               null: false, unsigned: true
    t.integer  "user_id",                                  null: false, unsigned: true
    t.string   "status",       limit: 9, default: "saved", null: false
    t.datetime "submitted_at"
    t.boolean  "reviewed",               default: false,   null: false
    t.datetime "reviewed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["group_id"], name: "evidence_group_id_foreign", using: :btree
    t.index ["project_id"], name: "evidence_project_id_foreign", using: :btree
    t.index ["user_id"], name: "evidence_user_id_foreign", using: :btree
  end

  create_table "evidence_asset", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "type_id",                               null: false, unsigned: true
    t.integer  "evidence_id",                           null: false, unsigned: true
    t.integer  "step_id"
    t.integer  "step_order",  limit: 1
    t.integer  "order",       limit: 1,     default: 1, null: false
    t.text     "content",     limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["evidence_id"], name: "evidence_asset_evidence_id_foreign", using: :btree
    t.index ["type_id"], name: "evidence_asset_type_id_foreign", using: :btree
  end

  create_table "evidence_type", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",       limit: 50,                    null: false
    t.boolean  "active",                   default: false, null: false
    t.string   "icon",       limit: 75
    t.text     "validation", limit: 65535
    t.text     "messages",   limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "evidence_user", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "evidence_id", null: false, unsigned: true
    t.integer  "user_id",     null: false, unsigned: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_project", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "group_id",             null: false, unsigned: true
    t.integer  "project_id",           null: false, unsigned: true
    t.integer  "order",      limit: 2, null: false, unsigned: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["group_id"], name: "group_project_group_id_foreign", using: :btree
    t.index ["project_id"], name: "group_project_project_id_foreign", using: :btree
  end

  create_table "group_user", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id",               null: false, unsigned: true
    t.integer  "group_id",              null: false, unsigned: true
    t.string   "status",                null: false
    t.string   "code",       limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["group_id"], name: "group_user_group_id_foreign", using: :btree
    t.index ["user_id"], name: "group_user_user_id_foreign", using: :btree
  end

  create_table "groups", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "site_id",                    null: false, unsigned: true
    t.string   "name",                       null: false
    t.string   "label"
    t.string   "code",                       null: false
    t.boolean  "tos",        default: false, null: false
    t.integer  "created_by",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "license_site", primary_key: ["license_id", "site_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "license_id", null: false, unsigned: true
    t.integer "site_id",    null: false, unsigned: true
    t.index ["site_id"], name: "license_site_site_id_foreign", using: :btree
  end

  create_table "licenses", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",                  null: false
    t.string   "code",                  null: false
    t.integer  "created_by",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "external_reference_id", null: false
  end

  create_table "migrations", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "migration", null: false
    t.integer "batch",     null: false
  end

  create_table "network_site", primary_key: ["network_id", "site_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "network_id", null: false, unsigned: true
    t.integer "site_id",    null: false, unsigned: true
    t.index ["site_id"], name: "network_site_site_id_foreign", using: :btree
  end

  create_table "networks", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",       null: false
    t.string   "label"
    t.string   "code",       null: false
    t.integer  "created_by", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "license_id", null: false
  end

  create_table "password_resets", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "email",                                           null: false
    t.string   "token",                                           null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["email"], name: "password_resets_email_index", using: :btree
    t.index ["token"], name: "password_resets_token_index", using: :btree
  end

  create_table "permission_role", primary_key: ["permission_id", "role_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "permission_id", null: false, unsigned: true
    t.integer "role_id",       null: false, unsigned: true
    t.index ["role_id"], name: "permission_role_role_id_foreign", using: :btree
  end

  create_table "permissions", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",       null: false
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profile_ethnicity", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",       limit: 50,             null: false
    t.integer  "order",      limit: 1,  default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id",                  null: false, unsigned: true
    t.string   "first_name",               null: false
    t.string   "last_name",                null: false
    t.string   "avatar",                   null: false
    t.date     "birth_date",               null: false
    t.integer  "ethnicity_id",                          unsigned: true
    t.string   "phone",        limit: 25
    t.string   "gender",       limit: 6,   null: false
    t.string   "bio",          limit: 140
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "profiles_user_id_foreign", using: :btree
  end

  create_table "projects", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "title",                    null: false
    t.string   "teaser",     limit: 200,   null: false
    t.string   "thumbnail"
    t.text     "categories", limit: 65535, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "role_user", primary_key: ["role_id", "user_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "role_id", null: false, unsigned: true
    t.integer "user_id", null: false, unsigned: true
    t.index ["user_id"], name: "role_user_user_id_foreign", using: :btree
  end

  create_table "roles", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",       null: false
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_type", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",       limit: 50, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_user", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id",    null: false, unsigned: true
    t.integer  "school_id",  null: false, unsigned: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "type_id",                default: 1, null: false, unsigned: true
    t.string   "nces_id",    limit: 24,              null: false
    t.string   "name",       limit: 200,             null: false
    t.string   "city",       limit: 150
    t.string   "state_abbr", limit: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["state_abbr"], name: "schools_state_abbr_index", using: :btree
    t.index ["type_id"], name: "schools_type_id_index", using: :btree
  end

  create_table "site_user", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id",               null: false, unsigned: true
    t.integer  "site_id",               null: false, unsigned: true
    t.string   "code",       limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",       null: false
    t.string   "label"
    t.string   "code"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "hash",         limit: 100
    t.integer  "context_id",               null: false, unsigned: true
    t.string   "context_type",             null: false
    t.string   "path"
    t.string   "mime",         limit: 50
    t.string   "ext",          limit: 4
    t.string   "size",         limit: 12
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["context_id", "context_type"], name: "uploads_context_id_context_type_index", using: :btree
  end

  create_table "users", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "token",          limit: 20
    t.string   "name",                                         null: false
    t.string   "username",       limit: 100
    t.string   "email",                                        null: false
    t.string   "password",       limit: 60,                    null: false
    t.text     "credly",         limit: 65535
    t.datetime "last_login",                                   null: false
    t.string   "remember_token", limit: 100
    t.boolean  "tos",                          default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "verified_at"
    t.integer  "verified_by",                                               unsigned: true
    t.integer  "default_group",                                null: false, unsigned: true
    t.index ["email"], name: "users_email_unique", unique: true, using: :btree
  end

  add_foreign_key "curriculum_projects", "curricula", column: "curriculum_id", name: "curriculum_projects_curriculum_id_foreign", on_delete: :cascade
  add_foreign_key "evidence", "groups", name: "evidence_group_id_foreign"
  add_foreign_key "evidence", "projects", name: "evidence_project_id_foreign"
  add_foreign_key "evidence", "users", name: "evidence_user_id_foreign"
  add_foreign_key "evidence_asset", "evidence", name: "evidence_asset_evidence_id_foreign"
  add_foreign_key "evidence_asset", "evidence_type", column: "type_id", name: "evidence_asset_type_id_foreign"
  add_foreign_key "group_project", "groups", name: "group_project_group_id_foreign", on_delete: :cascade
  add_foreign_key "group_project", "projects", name: "group_project_project_id_foreign", on_delete: :cascade
  add_foreign_key "group_user", "groups", name: "group_user_group_id_foreign", on_delete: :cascade
  add_foreign_key "group_user", "users", name: "group_user_user_id_foreign", on_delete: :cascade
  add_foreign_key "license_site", "licenses", name: "license_site_license_id_foreign", on_delete: :cascade
  add_foreign_key "license_site", "sites", name: "license_site_site_id_foreign", on_delete: :cascade
  add_foreign_key "network_site", "networks", name: "network_site_network_id_foreign", on_delete: :cascade
  add_foreign_key "network_site", "sites", name: "network_site_site_id_foreign", on_delete: :cascade
  add_foreign_key "permission_role", "permissions", name: "permission_role_permission_id_foreign", on_delete: :cascade
  add_foreign_key "permission_role", "roles", name: "permission_role_role_id_foreign", on_delete: :cascade
  add_foreign_key "profiles", "users", name: "profiles_user_id_foreign"
  add_foreign_key "role_user", "roles", name: "role_user_role_id_foreign", on_delete: :cascade
  add_foreign_key "role_user", "users", name: "role_user_user_id_foreign", on_delete: :cascade
  add_foreign_key "schools", "school_type", column: "type_id", name: "schools_type_id_foreign"
end
