class User < ApplicationRecord
  rolify
	has_many :competencies
	has_many :products, through: :competencies
	has_many :weeks, through: :weekly_report
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
