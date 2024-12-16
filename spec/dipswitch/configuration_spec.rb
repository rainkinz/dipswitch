require 'spec_helper'

module Dipswitch
  describe "Configuration" do
    before(:all) do
      Dipswitch.configure do |config|
        config.feature :new_ui do |user|
          'bella' == user.username
        end
      end
    end

    it "configures features" do
      expect(Dipswitch.configuration.features.to_a.size).to eq(1)
    end
  end
end
