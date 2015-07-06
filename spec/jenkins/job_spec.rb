require 'spec_helper'

RSpec.describe Suricate::Jenkins::Job do
  subject { Suricate::Jenkins::Job.new(name: name, url: url) }
  let(:name) { 'backup db' }
  let(:url)  { 'http://jenkins.dev/jobs/backup_db' }

  describe '#failed' do
    it 'returns false if not failed' do
      subject = Suricate::Jenkins::Job.new
      expect(subject.failed?).to be_falsy
    end

    it 'returns true if job failed' do
      subject = Suricate::Jenkins::Job.new(failed: true)
      expect(subject.failed?).to be_truthy
    end
  end

  describe '#name' do
    it 'returns name' do
      expect(subject.name).to eq(name)
    end
  end

  describe '#url' do
    it 'returns url' do
      expect(subject.url).to eq(url)
    end
  end
end
