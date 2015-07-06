require 'spec_helper'
require 'json'

RSpec.describe Suricate::Jenkins::Client do
  context 'getting jobs' do
    before(:each) do
      jobs = JSON.parse(File.read(resource_path('jobs.json')))
      expect(subject).to receive(:get).and_return(jobs)
    end

    describe '#failed_jobs' do
      it 'returns only failed jobs' do
        jobs = subject.failed_jobs
        job  = jobs.first

        expect(jobs.size).to eq(1)
        expect(job.name).to eq('failed_job')
        expect(job.failed?).to be_truthy
      end
    end

    describe '#jobs' do
      it 'returns an array of Job' do
        jobs = subject.jobs
        expect(jobs.size).to eq(2)
      end
    end
  end
end
