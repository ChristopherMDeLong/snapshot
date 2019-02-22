require 'spec_helper'

describe Restaurant do

  it { should have_valid(:name).when("Longshore Restaurant") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:address).when("1077 Main Street") }
  it { should_not have_valid(:address).when(nil, "") }

  it { should have_valid(:city).when("Chatham") }
  it { should_not have_valid(:city).when(nil, "") }

  it { should have_valid(:state).when("MA") }
  it { should_not have_valid(:state).when(nil, "") }

  it { should have_valid(:zip).when(02662, "02653") }
  it { should_not have_valid(:zip).when(nil, "") }

  it { should belong_to(:user) }
  it { should have_many(:reports) }

end
