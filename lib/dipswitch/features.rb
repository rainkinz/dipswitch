require 'set'

module Dipswitch

  # A Collection of +Feature+s with some helper methods to make the overall
  # determination of a feature with multiple gates is enabled or not
  class Features
    include Enumerable

    def initialize
      @features = {}
    end

    def clear!
      @features = {}
    end

    def add(name, &block)
      @features[name] ||= []
      @features[name] << Feature.new(name, block)
    end

    def on?(name, *args)
      Array(@features[name.to_sym]).any? {|feature| feature.on?(*args) }
    end

    def with(name, *args, &block)
      block.call if on?(name, *args)
    end

    def for(*args)
      to_a.reduce({}) do |acc, feature|
        acc[feature.name] = true if feature.on?(*args)
        acc
      end
    end


    def to_a
      @features.values.flatten
    end

    def each
      to_a.each do |f|
        yield f
      end
    end

  end

end
