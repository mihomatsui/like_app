class Users::PasswordsController < Devise::PasswordsController
  before_action :ensure_normal_user, only: :create

  # ログインを必須にしているので、root_pathを設定するとアカウント登録もしくはログインしてください。という表示になる
  # パスは通っている
  def ensure_normal_user
    if params[:user][:email].downcase == "guest@example.com"
      # redirect_to new_user_session_path, alert: "ゲストユーザーのパスワード再設定はできません。"だと
      # ゲストユーザーのパスワード再設定はできません。というアラートが表示される。
      redirect_to root_path, alert: "ゲストユーザーのパスワード再設定はできません。"
    end
  end
end