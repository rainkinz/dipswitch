require 'dipswitch/version'
require 'dipswitch/config'
require 'dipswitch/feature'

module Dipswitch

  def configure(&block)
    yield configuration
  end

  def configuration
    @configuration ||= Configuration.new
  end
end
