class FriendshipsController < ApplicationController
	before_action :find_user

	def create
		current_user.follow(@user)
		redirect_to profile_path(@user)
		Notification.create(user_id: current_user.id, message: "You followed the #{@user.email}.")
		flash[:success] = "You followed the #{@user.email}."
	end

	def destroy
		current_user.unfollow(@user)
		redirect_to profile_path(@user)
		Notification.create(user_id: current_user.id, message: "The #{@user.email} was successfully unfollowed.")
		flash[:success] = "The #{@user.email} was successfully unfollowed."
	end

	private

		def find_user
			@user = User.find(params[:user_id])
		end
end