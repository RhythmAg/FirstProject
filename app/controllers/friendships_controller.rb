class FriendshipsController < ApplicationController
	before_action :find_user

	def create
		current_user.follow(@user)
		redirect_to profile_path(@user)
		flash[:success] = "You followed the #{@user.email}."
	end

	def destroy
		current_user.unfollow(@user)
		redirect_to profile_path(@user)
		flash[:success] = "The #{@user.email} was successfully unfollowed."
	end

	private

		def find_user
			@user = User.find(params[:user_id])
		end
end