# encoding: utf-8
FactoryGirl.define do
	factory :user do
		nome 'Bruno'
		email 'brunomello.andrade@gmail.com'
		password '123456'
		password_confirmation '123456'
	end

end