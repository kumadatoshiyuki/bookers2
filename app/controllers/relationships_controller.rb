class RelationshipsController < ApplicationController

    def get_follow
        @user = User.find(params[:id])
    end

    def get_follower
        @user = User.find(params[:id])
    end

    def follow
    current_user.follow(params[:id])
    redirect_back(fallback_location: root_path)
    end

    def unfollow
    current_user.unfollow(params[:id])
    redirect_back(fallback_location: root_path)
    end

end
