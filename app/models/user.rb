class User < ActiveRecord::Base
	has_many :user_instructions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :vkontakte, :twitter]
    
    def self.from_omniauth(auth)
    	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    		user.name = auth.info.name
    		#user.email = auth.info.email
    		user.password = Devise.friendly_token[0, 20]
    	end

    	#where(email: auth.info.email).first_or_create do |user|
    		
    	#	user.password = Devise.friendly_token[0, 20]
    	#end

    end

    def self.new_with_sessions(params, session)
    	super.tap do |user|
    		if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
    			user.email = data["email"] if user.email.blank?
    			
    		end
    		if data = session["devise.vkontakte_data"] && session["devise.vkontakte_data"]["extra"]["raw_info"]
    			user.email = data["email"] if user.email.blank?
    			
    		end
    		
    	end
    end

    def email_required?
  		false
	end

end
