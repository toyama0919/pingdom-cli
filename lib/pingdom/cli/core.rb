require 'rest-client'
require 'json'

module Pingdom
  module Cli
    class Core

      def initialize(config)
        @config = config
        @url = "https://#{CGI::escape @config['user']}:#{CGI::escape @config['password']}@api.pingdom.com/api/2.0/checks"
        @header = {"App-Key" => @config['app_key']}
      end

      def checks
        response = RestClient.get(@url, @header)
        results = JSON.parse(response.body, :symbolize_names => true)
        results[:checks].each do |result|
          result[:lasttesttime] = Time.at(result[:lasttesttime]) unless result[:lasttesttime].nil?
          result[:lasterrortime] = Time.at(result[:lasterrortime]) unless result[:lasterrortime].nil?
          result[:created] = Time.at(result[:created]) unless result[:created].nil?
        end
        results
      end

      def update(params)
        response = RestClient.put(@url, params, @header)
        response.body
      end

    end
  end
end
