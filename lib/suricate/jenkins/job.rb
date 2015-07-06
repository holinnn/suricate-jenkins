module Suricate::Jenkins
  class Job
    attr_reader :name, :url

    def initialize(options = {})
      @name = options[:name]
      @url = options[:url]
      @failed = options[:failed]
    end

    def failed?
      @failed
    end
  end
end
