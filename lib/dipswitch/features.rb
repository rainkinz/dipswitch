module Dipswitch
  class Feature

    def initialize
      @features = {}
    end

    def add(name, &block)
      @features[name] = block
    end

    def on?(name, *args)
      @features[name.to_sym].call(*args)
    end
  end
end
