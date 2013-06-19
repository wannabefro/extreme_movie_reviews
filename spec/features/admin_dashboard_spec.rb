require 'spec_helper'

describe 'Visiting the admin page' do 
	let(:admin) { FactoryGirl.create(:admin) }
	let(:user) { FactoryGirl.create(:user) }


	it 'should allow admin to visit admin page' do 
		sign_in_as admin
		visit extmin_index_path
		page.should have_content('All Users')
		expect(current_path).to eql(extmin_index_path)
	end

	it 'should not allow a non admin to vist', focus: true do 
		sign_in_as user 
		visit extmin_index_path
		page.should have_content('You aint no admin')
		expect(current_path).to eql(root_path)
	end
end