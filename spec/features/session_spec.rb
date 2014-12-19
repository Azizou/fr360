require 'rails_helper'

describe 'User Sessions' do
	let!(:user){FactoryGirl.create(:user)}
	let(:email){'johndoe@email.com'}
	let(:password){'test'}

	before :each do
		visit root_path
	end

	context 'Wrong password' do
		before :each do
			fill_in 'Email address:', with: email
		end

		it 'should have error for wrong' do
			fill_in 'Password', with: 'wrong'
			click_button 'Login'
			expect(page).to have_content('Wrong email/password combination')
		end

		it 'should have error for no password' do
			fill_in 'Password', with: ''
			click_button 'Login'
			expect(page).to have_content('Password field cannot be blank.')
		end
	end

	context 'Success' do
		it 'should see the members page' do
			fill_in 'Email address:', with: email
			fill_in 'Password:', with: password
			click_button 'Login'
			expect(current_path).to eql(members_path)
		end
	end

end