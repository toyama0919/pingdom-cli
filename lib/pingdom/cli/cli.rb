#! /usr/bin/env ruby
# -*- encoding: UTF-8 -*-
require 'thor'
require 'json'
require 'yaml'

module Pingdom
  module Cli
    class CLI < Thor
      include Thor::Actions
      map '-l' => :checks
      class_option :config, aliases: '--config', type: :string, default: "#{ENV['HOME']}/.pingdomrc", desc: 'config file'
      def initialize(args = [], options = {}, config = {})
        super(args, options, config)
        @global_options = config[:shell].base.options
        @config = YAML.load_file(@global_options['config'])
        @core = Core.new(@config)
      end

      desc "config", "config"
      def config
        puts_json @config
      end

      desc "checks", "checks"
      def checks
        puts_json @core.checks
      end

      desc "actions", "actions"
      def actions
        puts_json @core.actions
      end

      desc "contacts", "contacts"
      def contacts
        puts_json @core.contacts
      end

      desc "probes", "probes"
      def probes
        puts_json @core.probes
      end

      desc "reference", "reference"
      def reference
        puts_json @core.reference
      end

      desc "reports_public", "reports_public"
      def reports_public
        puts_json @core.reports_public
      end

      desc "settings", "settings"
      def settings
        puts_json @core.settings
      end

      desc "credits", "credits"
      def credits
        puts_json @core.credits
      end

      desc "pause", "pause"
      def pause
        puts @core.update({ paused: true })
      end

      desc "unpause", "unpause"
      def unpause
        puts @core.update({ paused: false })
      end

      desc "update", "update"
      option :params, type: :hash, default: {}, desc: 'params'
      def update
        puts @core.update(options['params'])
      end

      private

      def puts_json(object)
        puts JSON.pretty_generate(object)
      end
    end
  end
end

