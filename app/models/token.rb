class Token < ApplicationRecord
  belongs_to :user
  
  validates :secret, :expire_at, presence: true
  validates :secret, uniqueness: true

  before_validation :set_secret, on: :create 
  before_validation :set_expire_at, on: :create

  protected
  def set_secret
    begin
      self.secret = SecureRandom.uuid.gsub(/-/, '')
    end while (Token.where(secret: self.secret).any?)  
  end

  def set_expire_at
    self.expire_at = 1.week.from_now
  end
end
