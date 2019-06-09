class User < ApplicationRecord
  has_secure_password

  validates :email, :username, presence: true, uniqueness: true
  validates :password, :role, presence: true, on: :create

  before_save :format_downcase

  has_one_attached :avatar
  has_many :tokens, dependent: :destroy
  belongs_to :storage, optional: true, dependent: :destroy

  protected 
  def format_downcase
    self.email.downcase!
    self.username.downcase!
  end
end