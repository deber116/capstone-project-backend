class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create] 

    def create
        @user = User.create(user_params)
        if @user.valid?
            Watchlist.create(user: @user)
            @token = encode_token(user_id: @user.id)
            render json: { user: UserSerializer.new(@user), jwt: @token}, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def profile
        token = encode_token(user_id: current_user.id)
        render json: {user: UserSerializer.new(current_user), jwt: token}
    end

     
    private
    def user_params
        params.require(:user).permit(:username, :password, :email, :token)
    end
end
