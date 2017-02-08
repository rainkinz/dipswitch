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
  end

end
