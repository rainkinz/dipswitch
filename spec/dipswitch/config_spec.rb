require 'spec_helper'

module Dipswitch

  describe "Configuration" do

    before(:all) do
      Dipswitch.configure do |config|
        config.feature :new_ui do |user|
          ['tom', 'brendan'].include?(user.username)
        end
      end
    end

    it "configures features" do
      expect(Dipswitch.configuration.features.list.size).to eq(1)
    end

    # TODO: Think about this
    # it "cannot be modified once configured and frozen" do
    #   expect do
    #     Dipswitch.configure do |config|
    #       # should throw
    #       config.feature :beta do |user|
    #         true
    #       end
    #     end
    #   end.to raise_error(RuntimeError, /can't modify frozen Hash/)
    # end

  end

end
