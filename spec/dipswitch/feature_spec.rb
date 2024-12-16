require 'spec_helper'
require 'support/fake_user'

module Dipswitch
  RSpec.describe Feature do
    describe "#==" do
      it "calls 2 instances equal if they point to the same proc/lambda" do
        proc1 = Proc.new{|user| ['bella'].include?(user.username)}

        f1 = described_class.new("f1", proc1)
        f2 = described_class.new("f1", proc1)

        expect(f1).to eq(f2)
      end

      it "calls 2 instances unequal if they point to different procs/lambdas" do
        # Even though the procs are the same functionally they're treated as
        # being different in this case. If the same logic is repeated at least
        # the result for whether a feature is enabled or not will be the same.
        proc1 = Proc.new{|user| ['bella'].include?(user.username)}
        proc2 = Proc.new{|user| ['bella'].include?(user.username)}

        f1 = described_class.new("f1", proc1)
        f2 = described_class.new("f1", proc2)

        expect(f1).to_not eq(f2)
      end

    end

    describe "determining if a feature is enabled when defined using blocks" do

      let(:feature) {
        f = described_class.new(:new_ui) do |user|
          ['bella'].include?(user.username)
        end
      }

      it "determines if a feature is enabled" do
        expect(feature.on?(FakeUser.new('bella'))).to be_truthy
      end

      it "determines if a feature is disabled" do
        expect(feature.on?(FakeUser.new('john', false))).to be_falsy
      end
    end

    describe "determining if a feature is enabled when passed a proc like object" do
      let(:feature) {
        proc1 = Proc.new{|user| ['bella'].include?(user.username)}
        f = described_class.new(:new_ui, proc1)
      }

      it "determines if a feature is enabled" do
        expect(feature.on?(FakeUser.new('bella'))).to be_truthy
      end

      it "determines if a feature is disabled" do
        expect(feature.on?(FakeUser.new('john', false))).to be_falsy
      end
    end
  end
end
