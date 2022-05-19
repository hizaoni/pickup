class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数字を混合して設定してください'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー\s　]+\z/, message: 'は全角文字を使用してください' } do
    validates :name
    validates :division
  end
end
