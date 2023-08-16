# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :users do
      add_unique_constraint :email
    end
  end
end
