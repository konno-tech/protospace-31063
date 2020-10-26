class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,       presence: true
  validates :profile,    presence: true
  validates :occupation, presence: true
  validates :position,   presence: true

  #アカウント削除機能は実装しないが、sequel proにて削除した場合、紐づくprototypeとcommentを削除する
  has_many :prototypes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
end
