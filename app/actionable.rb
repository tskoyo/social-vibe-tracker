# frozen_string_literal: true

require "hanami/action"

module SocialVibeTracker
  module Actionable
    def self.included(base)
      base.extend ClassMethods
      base.include InstanceMethods
    end

    module ClassMethods
      def prepare(&block)
        return unless block_given?

        @init_block = block
      end
    end

    module InstanceMethods
      def initialize(params)
        @params = params

        self.class.instance_variable_get(:@init_block).is_a?(Proc) &&
          instance_exec(&self.class.instance_variable_get(:@init_block))
      end

      def contract(arg_name)
        create_ivar(arg_name)

        @valid_params = instance_variable_get("@#{arg_name}").call(@params)
      end

      private

      def create_ivar(arg_name)
        class_name = "SocialVibeTracker::Contracts::#{arg_name.to_s.split('_').map(&:capitalize).join}Contract"

        instance_variable_set(
          "@#{arg_name}",
          Object.const_get(class_name).new
        )
      end
    end
  end
end
