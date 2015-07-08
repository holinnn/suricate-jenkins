require 'spec_helper'

RSpec.describe Suricate::Jenkins::FailingJobsStatusCollector do
  subject { Suricate::Jenkins::FailingJobsStatusCollector.new(alert_above: 2,
                                                              warning_above: 1) }
  let(:response) { double('response') }

  describe '#populate' do
    it 'calls alert! if count is above alert limit' do
      expect(subject).to receive(:failed_jobs_count).and_return(2)
      expect(response).to receive(:warning!)
      expect(response).to receive(:alert!)
      subject.populate(response)
    end

    it 'calls warning! if calls is above warning limit' do
      expect(subject).to receive(:failed_jobs_count).and_return(1)
      expect(response).to receive(:warning!)
      subject.populate(response)
    end
  end
end
