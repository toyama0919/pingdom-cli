require 'rest-client'
require 'json'

module Pingdom
  module Cli
    class Core

      def initialize(config)
        @config = config
        @url_base = "https://api.pingdom.com/api/2.0/"
        @header = { "App-Key" => @config['app_key'] }
      end

      def checks
        response = get_resource('checks').get
        results = JSON.parse(response.body, :symbolize_names => true)
        results[__method__].each do |result|
          result[:lasttesttime] = Time.at(result[:lasttesttime]) unless result[:lasttesttime].nil?
          result[:lasterrortime] = Time.at(result[:lasterrortime]) unless result[:lasterrortime].nil?
          result[:created] = Time.at(result[:created]) unless result[:created].nil?
        end
        results[__method__]
      end

      def actions
        response = get_resource('actions').get
        JSON.parse(response.body, :symbolize_names => true)[__method__]
      end

      def contacts
        response = get_resource('contacts').get
        JSON.parse(response.body, :symbolize_names => true)[__method__]
      end

      def probes
        response = get_resource('probes').get
        JSON.parse(response.body, :symbolize_names => true)[__method__]
      end

      def reference
        response = get_resource('reference').get
        JSON.parse(response.body, :symbolize_names => true)[__method__]
      end

      def reports_public
        response = get_resource('reports.public').get
        JSON.parse(response.body, :symbolize_names => true)[__method__]
      end

      def settings
        response = get_resource('settings').get
        JSON.parse(response.body, :symbolize_names => true)[__method__]
      end

      def credits
        response = get_resource('credits').get
        JSON.parse(response.body, :symbolize_names => true)[__method__]
      end

      def update(params)
        response = get_resource('checks').put(params)
        response.body
      end

      private
      def get_resource(action)
        resource = RestClient::Resource.new(
          @url_base + action,
          :user  =>  @config['user'],
          :password  =>  @config['password'],
          :headers => { 'App-Key' => @config['app_key'] },
          :verify_ssl => false
        )
      end
    end
  end
end
