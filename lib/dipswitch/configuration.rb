module Dipswitch

  def self.configure(&block)
    yield configuration
    # configuration.freeze
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.on?(name, *args)
    # TODO: Not loving this so much. Maybe simplify
    configuration.features.on?(name, *args)
  end

  class Configuration
    attr_reader :features

    def initialize
      @features = Features.new
    end

    def feature(name, &block)
      @features.add(name, &block)
    end

    def freeze
      @features.freeze
    end
  end

end
