require 'spec_helper'
require 'valid_attribute'
require 'pry'

describe Movie do 


	describe "have a valid title" do 
		it { should have_valid(:title).when('IronMan') }
		it { should_not have_valid(:title).when('', nil) }

	end

	describe 'validates year' do 
		it { should have_valid(:year).when(1988) }
		it { should_not have_valid(:title).when('', nil) }

	end

	describe 'validates format of year as four characters' do 
		it { should have_valid(:year).when(1900) }
		it { should_not have_valid(:year).when(80,1,198,"poop") }
	end

	it 'validates the uniqueness of movie title && year' do
		FactoryGirl.create(:movie)
		expect(FactoryGirl.build(:movie).valid?).to eq(false)
		expect(FactoryGirl.build(:movie, :year => 2008).valid?).to be_true
	end

end