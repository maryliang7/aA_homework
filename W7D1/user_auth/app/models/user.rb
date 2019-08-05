class User < ApplicationRecord
    validates :username, :session_token, presence: true
    validates :password_digest, presence: { message: 'Password can\'t be blank' }
    validates :password, length: { minimum: 6, allow_nil: true }

    attr_reader :password

    def self.find_by_credentials(username, pw)
        user = User.find_by(username: username)
        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def reset_session_token
        self.session_token = User.generate_session_token
        self.save!
    end

    def ensure_session_toke
        self.session_token ||= User.generate_session_token
    end

    def password=(something)
        @password = something
        self.password_digest = BCrypt::Password.create(something)
    end

end
