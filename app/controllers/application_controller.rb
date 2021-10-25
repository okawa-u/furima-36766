class ApplicationController < ActionController::Base
  before_action :basic_auth
  # Basic認証
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
      # deviseのモデルにパラメーターを許可(ストロングパラメーターの設定)
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :last_name, :first_name, :birth, :last_name_kana, :first_name_kana])
                                      # permit(:deviseの処理名, keys: [:許可するキー])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
    # 環境変数の呼び出し　BASIC_AUTH_USERという変数に格納されている値を取得
  end
end
