module Dipswitch

  def self.configure(&block)
    yield configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end


  class Configuration
    attr_reader :features

    def initialize
      @features = {}
    end

    def feature(name, &block)
      @features[name.to_sym] = block
    end
  end

end
