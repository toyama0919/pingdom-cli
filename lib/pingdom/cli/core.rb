require 'rest-client'
require 'json'

module Pingdom
  module Cli
    class Core

      def initialize(config)
        @config = config
        @url_base = "https://#{CGI::escape @config['user']}:#{CGI::escape @config['password']}@api.pingdom.com/api/2.0/"
        @header = {"App-Key" => @config['app_key']}
      end

      def checks
        response = RestClient.get(get_url('checks'), @header)
        results = JSON.parse(response.body, :symbolize_names => true)
        results[:checks].each do |result|
          result[:lasttesttime] = Time.at(result[:lasttesttime]) unless result[:lasttesttime].nil?
          result[:lasterrortime] = Time.at(result[:lasterrortime]) unless result[:lasterrortime].nil?
          result[:created] = Time.at(result[:created]) unless result[:created].nil?
        end
        results
      end

      def actions
        response = RestClient.get(get_url('actions'), @header)
        JSON.parse(response.body, :symbolize_names => true)
      end

      def contacts
        response = RestClient.get(get_url('contacts'), @header)
        JSON.parse(response.body, :symbolize_names => true)
      end

      def probes
        response = RestClient.get(get_url('probes'), @header)
        JSON.parse(response.body, :symbolize_names => true)
      end

      def reference
        response = RestClient.get(get_url('reference'), @header)
        JSON.parse(response.body, :symbolize_names => true)
      end

      def reports_public
        response = RestClient.get(get_url('reports.public'), @header)
        JSON.parse(response.body, :symbolize_names => true)
      end

      def settings
        response = RestClient.get(get_url('settings'), @header)
        JSON.parse(response.body, :symbolize_names => true)
      end

      def update(params)
        response = RestClient.put(get_url('checks'), params, @header)
        response.body
      end

      private
      def get_url(action)
        @url_base + action
      end
    end
  end
end
