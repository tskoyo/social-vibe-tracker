# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :users do
      primary_key :id
      column :email, :text, null: false
      column :password, :text, null: false
      column :first_name, :text, null: true
      column :last_name, :text, null: true
      column :created_at, :timestamp, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end
