class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  #
  # Associations
  #
  has_many(
    :imports
  )
  
  has_many(
    :persons
  )

  has_many(
    :person_emails
  )

  has_many(
    :person_phones
  )

has_many(
  :person_tags
)

  #
  # validation
  #
  
  validates(
    :first_name,
    presence: true
  )
  
  validates(
    :last_name,
    presence: true
  )

  validates(
    :mobile_number,
    presence: true,
    length:{
      maximum: 32
      }
  )
  validates_format_of(
    :email,
    presence: true,
    with: Devise.email_regexp
  )
end