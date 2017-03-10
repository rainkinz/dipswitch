module Dipswitch

  class Feature
    attr_reader :name, :gate

    def initialize(name, gate = nil, &block)
      @name = name

      if block_given?
        @gate = block
      else
        @gate = gate
      end
    end

    def on?(*args)
      @gate.call(*args)
    end

    def ==(o)
      o.class == self.class && o.name == name && o.gate == gate
    end
    alias_method :eql?, :==

    def hash
      "#{name}_#{gate.hash}".hash
    end

  end
end
