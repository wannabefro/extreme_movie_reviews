require 'spec_helper'

describe Movie do 


	describe "have a valid title" do 
		it { should have_valid(:title).when('IronMan') }
		it { should_not have_valid(:title).when('', nil) }

	end

	describe 'validates year' do 
		it { should have_valid(:year).when(1888,1900,2014) }
		it { should_not have_valid(:title).when('', nil) }

	end

	describe 'validates format of year as four characters' do 
		it { should have_valid(:year).when(1900) }
		it { should_not have_valid(:year).when(80,1,198,"poop") }
	end

	it 'validates the uniqueness of movie title && year' do
		FactoryGirl.create(:movie, title: "Ironman")
		(FactoryGirl.build(:movie, title: "Ironman").valid?).should be_false
		(FactoryGirl.build(:movie, title: "Ironman", :year => 2008).valid?).should be_true

	end

end
