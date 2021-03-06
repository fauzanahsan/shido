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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121020093301) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "admin_roles", ["name", "resource_type", "resource_id"], :name => "index_admin_roles_on_name_and_resource_type_and_resource_id"
  add_index "admin_roles", ["name"], :name => "index_admin_roles_on_name"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "admin_users_admin_roles", :id => false, :force => true do |t|
    t.integer "admin_user_id"
    t.integer "admin_role_id"
  end

  add_index "admin_users_admin_roles", ["admin_user_id", "admin_role_id"], :name => "index_on_admin_users_admin_roles"

  create_table "business_categories", :id => false, :force => true do |t|
    t.integer "business_id"
    t.integer "category_id"
  end

  add_index "business_categories", ["business_id", "category_id"], :name => "index_business_categories_on_business_id_and_category_id"

  create_table "business_photos", :force => true do |t|
    t.integer  "business_id"
    t.string   "name"
    t.string   "image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "businesses", :force => true do |t|
    t.integer  "user_id",                            :null => false
    t.integer  "account_manager_id"
    t.string   "company_name",       :default => "", :null => false
    t.string   "contact_person",     :default => ""
    t.text     "detail",             :default => ""
    t.string   "office_phone1",      :default => ""
    t.string   "office_phone2",      :default => ""
    t.string   "mobile_phone1",      :default => ""
    t.string   "mobile_phone2",      :default => ""
    t.string   "region"
    t.string   "city"
    t.text     "address"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "biz_name",           :default => ""
    t.text     "products_services",  :default => ""
    t.string   "website",            :default => ""
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
  end

  add_index "businesses", ["account_manager_id"], :name => "index_businesses_on_account_manager_id"
  add_index "businesses", ["user_id"], :name => "index_businesses_on_user_id"

  create_table "campaign_package_orders", :force => true do |t|
    t.integer  "order_id"
    t.integer  "campaign_package_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "campaign_packages", :force => true do |t|
    t.string   "package_name",              :default => "", :null => false
    t.string   "description"
    t.integer  "fee",          :limit => 8, :default => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "campaign_tasks", :force => true do |t|
    t.integer  "staff_id"
    t.integer  "order_id",                       :null => false
    t.string   "working_status", :default => "", :null => false
    t.datetime "completed_date"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.text     "task_name",      :default => "", :null => false
    t.string   "title",          :default => ""
    t.datetime "target_date"
  end

  add_index "campaign_tasks", ["order_id"], :name => "index_campaign_tasks_on_order_id"
  add_index "campaign_tasks", ["staff_id"], :name => "index_campaign_tasks_on_staff_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["name"], :name => "index_categories_on_name"

  create_table "cities", :force => true do |t|
    t.integer  "region_id"
    t.string   "city_name",  :default => "", :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "invoices", :force => true do |t|
    t.integer  "sales_id"
    t.integer  "user_id",                                :null => false
    t.integer  "order_id",                               :null => false
    t.datetime "order_date"
    t.integer  "fee",        :limit => 8, :default => 0
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "invoices", ["order_id"], :name => "index_invoices_on_order_id"
  add_index "invoices", ["sales_id"], :name => "index_invoices_on_sales_id"
  add_index "invoices", ["user_id"], :name => "index_invoices_on_user_id"

  create_table "orders", :force => true do |t|
    t.integer  "sales_id"
    t.integer  "user_id",                                         :null => false
    t.integer  "account_manager_id"
    t.string   "sales_status",                    :default => "", :null => false
    t.datetime "order_date"
    t.integer  "fee",                :limit => 8, :default => 0
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.text     "notes",                           :default => ""
  end

  add_index "orders", ["sales_id"], :name => "index_orders_on_sales_id"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "production_task_photos", :force => true do |t|
    t.integer  "production_task_id"
    t.string   "name"
    t.string   "image"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "production_tasks", :force => true do |t|
    t.integer  "staff_id"
    t.integer  "order_id",                       :null => false
    t.string   "working_status", :default => "", :null => false
    t.datetime "completed_date"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.text     "task_name",      :default => "", :null => false
    t.string   "title",          :default => ""
    t.datetime "target_date"
  end

  add_index "production_tasks", ["order_id"], :name => "index_production_tasks_on_order_id"
  add_index "production_tasks", ["staff_id"], :name => "index_production_tasks_on_staff_id"

  create_table "regions", :force => true do |t|
    t.string   "region_name", :default => "", :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "fullname",               :default => ""
    t.string   "phone",                  :default => ""
    t.integer  "account_manager_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "web_package_orders", :force => true do |t|
    t.integer  "order_id"
    t.integer  "web_package_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "web_packages", :force => true do |t|
    t.string   "package_name",              :default => "", :null => false
    t.string   "description"
    t.integer  "fee",          :limit => 8, :default => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

end
