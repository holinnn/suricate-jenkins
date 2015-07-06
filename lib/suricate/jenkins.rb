module Suricate
  module Jenkins
    autoload :Client,                       'suricate/jenkins/client'
    autoload :Job,                          'suricate/jenkins/job'
    autoload :FailingJobsCounterCollector,  'suricate/jenkins/collectors/failing_jobs_counter_collector'
  end
end
