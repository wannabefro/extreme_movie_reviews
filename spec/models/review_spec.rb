require 'spec_helper'
require 'valid_attribute'
require 'pry'

describe Review do
  
  describe "requires a valid title and valid body" do
    it { should have_valid(:title).when('Ironman Rocks - Part 2') }
    it { should_not have_valid(:title).when(nil, "") }
    
    it { should have_valid(:body).when("The best Ironman yet!") }
    it { should_not have_valid(:body).when(nil, "") }

    it { should belong_to(:user) }
    it { should belong_to(:movie) }
  end

end