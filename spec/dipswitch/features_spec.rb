require 'spec_helper'
require 'support/fake_user'

module Dipswitch

  describe Features do

    let(:features) {
      f = described_class.new
      f.add(:new_ui) do |user|
        ['bella'].include?(user.username)
      end

      f.add(:new_ui) do |user|
        user.admin?
      end

      f.add(:beta_user) do |user|
        user.username == 'beta'
      end

      f
    }

    it "determines if a feature is enabled" do
      expect(features.on?(:new_ui, FakeUser.new('bella'))).to be_truthy
    end

    it "determines if a feature is disabled" do
      expect(features.on?(:new_ui, FakeUser.new('john', false))).to be_falsy
    end

    it "determines if a feature is enabled when there are multiple rules" do
      expect(features.on?(:new_ui, FakeUser.new('john', true))).to be_truthy
    end

    it "enumerates features" do
      expect(features.select {|f| f.name == :new_ui }.size).to eq(2)
    end

    it "creates a hash of matched features for the given args" do
      expect(features.for(FakeUser.new('bella'))).to eq({
        :new_ui => true
      })

      expect(features.for(FakeUser.new('beta', true))).to eq({
        :new_ui => true,
        :beta_user => true
      })
    end
  end

end
