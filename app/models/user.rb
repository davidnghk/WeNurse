class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :locations
  has_many :bookings, :class_name => 'Booking', :foreign_key => 'sender_id' 
  has_many :services, :class_name => 'Booking', :foreign_key => 'server_id'
  has_one :payment
  accepts_nested_attributes_for :payment

  enum role: [:customer, :staff, :admin, :user, :vip]
  enum qualification: [:Helper, :Nurse, :Doctor]

  validates_presence_of :name
  validates_uniqueness_of :email
  
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def to_label
    "#{name}"
  end
  
end
