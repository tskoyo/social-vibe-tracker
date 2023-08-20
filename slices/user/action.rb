# frozen_string_literal: true

require 'pry'

module User
  class Action < Hanami::Action
    def self.prepare(&block)
      return unless block_given?

      instance_exec(&block)
    end

    def self.contract(arg_name)
      @@input_params = User::Slice["contracts.#{arg_name}_contract"]
    end

    def self.repository(arg_name)
      @@user_repo = User::Slice["repositories.#{arg_name}"]
    end

    def self.valid_params?(params)
      @@input_params.call(params).success?
    end
  end
end
