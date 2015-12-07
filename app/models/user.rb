class User < ActiveRecord::Base
  validates_presence_of :firstname, :surname, :email, :password, :address

  validates_uniqueness_of :email
  
  validates_format_of :email,
                      with: /\A([\w\.\-\+]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                      message: 'Bad email address format'

  validates :password, :confirmation => true,
                       :length => {:within => 6..20},
                       :on => :create

  validates :password_confirmation, presence: true,
                       :length => {:within => 6..20}

  validates :email, :confirmation => true
  validates :email_confirmation, presence: true

  has_secure_password  

  def firstname=(value)
    write_attribute :firstname, (value ? value.humanize : nil)
  end

  def surname=(value)
    write_attribute :surname, (value ? value.humanize : nil)
  end

#  def address=(value)
 #   write_attribute :address, (value ? value.humanize : nil)
  #end

  self.per_page = 4

end
