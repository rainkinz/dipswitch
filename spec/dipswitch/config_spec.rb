require 'spec_helper'

module Dipswitch

  describe Config do

    it "configures features" do
      Config.configure do |config|
        config.feature :new_ui do |user|
          ['tom', 'brendan'].include?(user.username)
        end
      end

      expect(Config.configuration.features.size).to eq(1)
    end

  end

end
