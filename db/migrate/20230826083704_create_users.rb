# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :users do
      primary_key :id
      column :email, String, null: false
      column :password, String, null: false
      column :first_name, String, null: false, size: 128
      column :last_name, String, null: false, size:128
      column :created_at, DateTime
      column :updated_at, DateTime
      index :email, unique: true
    end
  end
end
