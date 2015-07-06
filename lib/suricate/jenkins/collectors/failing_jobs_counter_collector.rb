module Suricate::Jenkins
  class FailingJobsCounterCollector
    def initialize(options = {})
      @client = Client.new(options)
    end

    def populate(response, params = {})
      count = failed_jobs_count
      response.value(count)
      response.alert! if count > 0
    end

    private
    def failed_jobs_count
      @client.failed_jobs.count
    end
  end
end
