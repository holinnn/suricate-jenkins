module Suricate::Jenkins
  class FailingJobsCounterCollector
    def initialize(options = {})
      @client = Client.new(options)
    end

    def populate(response, params = {})
      response.value(failed_jobs_count)
    end

    private
    def failed_jobs_count
      @client.failed_jobs.count
    end
  end
end
