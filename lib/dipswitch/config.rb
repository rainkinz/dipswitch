module Dipswitch

  module Config
    extend self

    def configure(&block)
      yield configuration
    end

    def configuration
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
end
