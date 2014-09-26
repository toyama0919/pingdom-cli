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
        JSON.parse(response.body, :symbolize_names => true)
      end

      def update(params)
        response = RestClient.put(@url, params, @header)
        response.body
      end

    end
  end
end
