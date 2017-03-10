# TODO: Rethink all these static methods
#
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

  def self.with(name, *args, &block)
    configuration.features.with(name, *args, &block)
  end

  def self.for(*args)
    configuration.features.for(*args)
  end

  def self.clear!
    configuration.clear!
  end

  class Configuration
    attr_reader :features

    def initialize
      @features = Features.new
    end

    def feature(name, &block)
      @features.add(name, &block)
    end

    def clear!
      @features.clear!
    end

  end

end
