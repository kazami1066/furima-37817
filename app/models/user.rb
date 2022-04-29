class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, format:{with: /(?=.[a-zA-Z])(?=.\d)[a-zA-Z\d]{7,}/}, confirmation: true
  validates :last_name, presence: true, format:{/\A[ぁ-んァ-ン一-龥]/}
  validates :first_name, presence: true, format:{/\A[ぁ-んァ-ン一-龥]/}
  validates :last_name_kana, presence: true, format:{/\A[ァ-ヶー－]+\z/}
  validates :first_name_kana, presence: true, format:{/\A[ァ-ヶー－]+\z/}
  validates :birth_date, presence: true

end
