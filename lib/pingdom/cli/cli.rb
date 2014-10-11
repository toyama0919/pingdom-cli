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
        puts @config.to_json
      end

      desc "checks", "checks"
      def checks
        puts @core.checks.to_json
      end

      desc "actions", "actions"
      def actions
        puts @core.actions.to_json
      end

      desc "contacts", "contacts"
      def contacts
        puts @core.contacts.to_json
      end

      desc "probes", "probes"
      def probes
        puts @core.probes.to_json
      end

      desc "reference", "reference"
      def reference
        puts @core.reference.to_json
      end

      desc "reports_public", "reports_public"
      def reports_public
        puts @core.reports_public.to_json
      end

      desc "settings", "settings"
      def settings
        puts @core.settings.to_json
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
    end
  end
end

