module Dipswitch
  class Feature

    def initialize
      @features = {}
    end

    def add(name, &block)
      @features[name] = block
    end

    def on?(name, *args)
      binding.pry

      @features[:name].call(args)
    end
  end
end
