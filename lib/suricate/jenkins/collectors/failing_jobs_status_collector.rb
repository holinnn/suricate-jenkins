module Suricate::Jenkins
  class FailingJobsStatusCollector
    def initialize(options = {})
      @alert_above    = options.delete(:alert_above) || 1
      @warning_above  = options.delete(:warning_above) || 1
      @client         = Client.new(options)
    end

    def populate(response, params = {})
      count = failed_jobs_count
      response.warning! if count >= @warning_above
      response.alert! if count >= @alert_above
    end

    private
    def failed_jobs_count
      @client.failed_jobs.count
    end
  end
end
