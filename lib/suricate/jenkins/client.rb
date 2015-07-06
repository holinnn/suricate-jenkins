require 'net/http'
require 'json'

module Suricate::Jenkins
  class Client
    def initialize(options = {})
      @url       = options[:url]
      @user_name = options[:user_name]
      @password  = options[:password]
    end

    def failed_jobs
      jobs.select(&:failed?)
    end

    def jobs
      json = get('/api/json')
      json['jobs'].map { |job_json| build_job(job_json) }
    end

    private
    def get(path)
      uri = URI.parse(@url + path)
      response = Net::HTTP.start(uri.hostname, uri.port) do |http|
        request = Net::HTTP::Get.new(uri)
        request.basic_auth(@user_name, @password)
        http.request(request)
      end

      JSON.parse(response.body)
    end

    def build_job(json)
      Job.new(name: json['name'],
              url: json['url'],
              failed: json['color'] == 'red')
    end
  end
end

