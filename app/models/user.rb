class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :shop

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
