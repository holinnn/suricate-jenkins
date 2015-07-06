require 'spec_helper'

RSpec.describe Suricate::Jenkins::FailingJobsCounterCollector do
  class TestResponse < Suricate::CounterWidgetResponse
    def _value
      @value
    end
  end

  describe '#populate' do
    it 'populates the visitor with the number of failing jobs' do
      expect(subject).to receive(:failed_jobs_count).and_return(5)
      response = TestResponse.new
      subject.populate(response)
      expect(response._value).to eq(5)
    end
  end
end
