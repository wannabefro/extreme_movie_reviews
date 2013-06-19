require 'spec_helper'

describe RecentMovies do
  it { should validate_presence_of(:movie) }
  it { should validate_presence_of(:user) }
end
