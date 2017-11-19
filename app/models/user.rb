class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :novels
         has_many :reviews, dependent: :destroy
         
 def admin?
   is_admin
 end

 def super_admin?
   is_super_admin
 end
end
