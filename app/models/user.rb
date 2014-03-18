class User
  include Mongoid::Document
  include Mongoid::Timestamps
  # include Mongoid::Paranoia

  embeds_one :access
  has_many   :logs,           :class_name => "Log",              :inverse_of => :logger
  has_many   :item_creations, :class_name => "Item",             :inverse_of => :creator
  has_many   :customer_sales, :class_name => "CustomerPurchase", :inverse_of => :cashier
  has_and_belongs_to_many :branches
  
  field :name,			:type => String, 	:default => ""
  field :status,		:type => String, 	:default => ""

  validates :access, :presence => true

  # before_save  :access_should_exist
  after_create :normalize_abilities

  # def access_should_exist
  #   if self.access.nil?
  #     self.access = Access.new
  #   end
  # end

  def normalize_abilities
    self.access.save
  end


  # Role Methods
  def can? action, branch, type
    return self.access.can? action, branch, type
  end
  
  def cannot? action, branch, type
    return !self.can?(action, branch, type)
  end

  def role_is? role
    return self.access.role_is? role
  end

  def role_above? role
    return self.access.role_above? role
  end

  def role_is_and_above? role
    return (self.role_is?(role) || self.role_above?(role))
  end

  def role_below? role
    return !self.role_is_and_above?(role)
  end



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
