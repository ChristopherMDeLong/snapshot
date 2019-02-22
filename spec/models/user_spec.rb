require 'rails_helper'

RSpec.describe User, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:user)).to be_valid
    end
  end

  context "validations" do
    context "presence" do
      it { should have_valid(:email).when("john@smith.com") }
      it { should have_valid(:encrypted_password).when("123456") }
    end

    context "invalid presence" do
      it { should_not have_valid(:email).when(nil, '', 'suzy') }
      it { should_not have_valid(:encrypted_password).when(nil, '') }
    end

    it { should have_many(:restaurants) }
  end
end
