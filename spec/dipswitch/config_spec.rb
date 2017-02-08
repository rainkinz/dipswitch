require 'spec_helper'

module Dipswitch

  describe "Configuration" do

    it "configures features" do
      Dipswitch.configure do |config|
        config.feature :new_ui do |user|
          ['tom', 'brendan'].include?(user.username)
        end
      end

      expect(Dipswitch.configuration.features.size).to eq(1)
    end

  end

end
