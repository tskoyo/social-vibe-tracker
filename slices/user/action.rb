# frozen_string_literal: true

module User
  class Action < Hanami::Action
    def self.prepare(&block)
      return unless block_given?

      instance_exec(&block)
    end

    def self.contract(arg_name)
      class_name = "User::Contracts::#{arg_name.to_s.split('_').map(&:capitalize).join}Contract"

      @input_params = Object.const_get(class_name).new
    end

    def self.valid_params?(params)
      @input_params.call(params).success?
    end
  end
end
