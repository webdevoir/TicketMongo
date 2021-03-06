class User
  include Mongoid::Document
  include Mongoid::Timestamps
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  field :first_name,         type: String, default: ""         
  field :last_name,          type: String, default: ""
  field :cellphone,          type: String, default: ""
  field :start,              type: Date, default: Time.now.strftime("%m/%d/%Y") 
  field :expire,             type: Date
  field :token_id,           type: String, default: ""

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
 
  def self.full_name
      first_name + " " + last_name
  end
 
  index({ token_id: 1 }, { unique: true, name: "token_id_index" })    
  
  has_one :company_group, :dependent => :destroy
#  belongs_to :company, :through => :company_groups
  
  
end
