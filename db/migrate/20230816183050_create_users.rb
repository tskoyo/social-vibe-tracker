# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :users do
      primary_key :id
      column :email, :text, null: false
      column :password, :text, null: false
      column :first_name, :text, null: false
      column :last_name, :text, null: false
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end
end
