class AuthController < ApplicationController
  skip_before_action :authenticate_request, only: [ :login ]

  def login
    user = User.find_by(email: params[:user][:email])

    if user&.valid_password?(params[:user][:password])
      token = JwtService.encode({ user_id: user.id })
      render json: { token: token }, status: :ok
    else
      render json: { error: "Credenciais inválidas" }, status: :unauthorized
    end
  end
end
