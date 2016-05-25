class User < ActiveRecord::Base
 #validates :uid,  presence: true
 #validates :name, presence: true
 #validates :login, presence: true
 #validates :oauth_token, presence: true
 #validates :avatar_url, presence: true

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid = auth_info.uid
      new_user.name = auth_info.info.name
      new_user.nickname = auth_info.info.nickname
      new_user.oauth_token = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
      new_user.avatar_url = auth_info.extra.raw_info.avatar_url
    end
  end
end
