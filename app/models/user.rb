class User
  include Mongoid::Document
  include Mongoid::Timestamps
  # include Mongoid::Paranoia

  # ENTER USER-SPECIFIC STUFF HERE

  ###### Devise Modules ##################################################
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable, :rememberable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  validates :encrypted_password, :presence => true
  validates :email, :presence => true, :uniqueness => true
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String
end
