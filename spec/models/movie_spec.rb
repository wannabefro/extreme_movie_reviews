require 'spec_helper'
require 'valid_attribute'

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

end