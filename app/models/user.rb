class User < ActiveRecord::Base

  devise :database_authenticatable, :omniauthable, :trackable

  attr_accessible :name, :email, :password, :provider, :uid

  def self.find_for_facebook_oauth access_token
    if user = User.where(email: access_token.extra.raw_info.email).first
      user
    else 
      User.create!(provider: access_token.provider, provider: access_token.provider,
                   name: access_token.extra.raw_info.name, uid: access_token.uid, 
                   email: access_token.extra.raw_info.email, password: Devise.friendly_token[0,20]) 
    end
  end

  def fullname
    name.blank? ? email : name
  end

end
