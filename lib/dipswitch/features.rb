module Dipswitch
  class Features
    def initialize
      @features = {}
    end

    def add(name, &block)
      @features[name] ||= []
      @features[name] << block
    end

    def on?(name, *args)
      (@features[name.to_sym] || []).any? {|feature| feature.call(*args) }
    end

    def list
      @features.keys
    end

    def freeze
      @features.freeze
    end
  end

end
