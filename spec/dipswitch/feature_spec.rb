require 'spec_helper'

module Dipswitch

  describe Feature do
    let(:features) {
      f = described_class.new
      f.add(:new_ui) do |user|
        ['bella'].include?(user.username)
      end
      f
    }

    it "determines if a feature is enabled" do
      expect(
        features.on?(:new_ui, double("User", username: 'bella'))
      ).to be_truthy
    end

  end

end
