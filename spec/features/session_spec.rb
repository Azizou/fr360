require 'rspec'

describe 'User Sessions' do

	let!(:user){User.create(first_name: first_name, last_name: last_name, email: email, password: password, password_confirmation: password)}
	let(:email){'test@test.com'}
	let(:password){'password'}

	context 'Failure' do
		before do
			visit root_path
			fill_in 'Email address:', with: email
			fill_in 'Password:', with: ''
			click_link 'Login'
		end
		it 'displays an error message' do
			expect(page).to have_content()
		end
	end

end