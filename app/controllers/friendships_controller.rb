class FriendshipsController < ApplicationController
	before_action :find_user

	def create
		current_user.follow(@user)
		redirect_to profile_path(@user)
		flash[:success] = 'You followed the user'
	end

	def destroy
		current_user.unfollow(@user)
		redirect_to profile_path(@user)
		flash[:success] = 'The user was successfully unfollow'
	end

	private

		def find_user
			@user = User.find(params[:user_id])
		end
end