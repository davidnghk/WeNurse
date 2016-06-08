class Booking < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :server, :class_name => 'User', :foreign_key => 'server_id'
  
  validates_associated :user
  validates_presence_of :user_id 

  enum helper_class: [:Helper, :Nurse]
  enum trip_type: [:OneWay, :RoundTrip]
  enum status: [:Booked, :Confirmed, :Completed, :Cancelled, :Paid, :Voided]

  before_save :calculate_fee
  before_update :calculate_fee
  
  public
  def self.i18n_trip_types(hash = {})
    trip_types.key.each { |key| hash[I18n.t("")]}
  end
  
  private
    def calculate_fee
      self.total_fee = self.hours * 70
    end

end
