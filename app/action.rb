# frozen_string_literal: true

require "hanami/action"
require "pry"

module SocialVibeTracker
  class Action < Hanami::Action
    def self.prepare(&block)
      return unless block_given?

      instance_exec(&block)
    end

    def self.contract(arg_name)
      create_ivar(arg_name)

      @input_params = instance_variable_get("@#{arg_name}")
    end

    def self.valid_params?(params)
      @input_params.call(params).errors.empty?
    end

    def self.create_ivar(arg_name)
      class_name = "SocialVibeTracker::Contracts::#{arg_name.to_s.split('_').map(&:capitalize).join}Contract"

      instance_variable_set(
        "@#{arg_name}",
        Object.const_get(class_name).new
      )
    end
  end
end
