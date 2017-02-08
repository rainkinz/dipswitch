require "spec_helper"
require 'support/fake_user'

describe Dipswitch do
  before(:all) do

    Dipswitch.configure do |config|
      config.feature(:new_ui) do |user|
        user.admin?
      end

      config.feature(:beta) do |user|
        ['bella'].include?(user.username)
      end

    end
  end

  let(:bella) { FakeUser.new('bella') }

  let(:admin) { FakeUser.new('admin', true) }

  it "can be configured and correctly interprets that configuration" do
    expect(Dipswitch.on?(:beta, bella)).to be_truthy
    expect(Dipswitch.on?(:new_ui, bella)).to be_falsy
  end

end

