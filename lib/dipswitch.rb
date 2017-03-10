require 'dipswitch/version'
require 'dipswitch/configuration'
require 'dipswitch/feature'
require 'dipswitch/features'

module Dipswitch

  def configure(&block)
    yield configuration
  end

  def configuration
    @configuration ||= Configuration.new
  end

end
