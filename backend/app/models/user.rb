class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # optional: trueにより関連付けられたPatientが存在しない場合でもエラーにならないようにする（患者本人登録時）
  belongs_to :patient, primary_key: :secret_id, foreign_key: :secret_patient_id, optional: true

  has_many :messages

  validates :login_id, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :name, presence: true

  # 下記バリデーションを行うことで、患者以外登録時にはsecret_patient_idが必須になる
  validate :secret_patient_id_presence

  private

  # 患者以外登録時にはpatient_idが必須になる
  def secret_patient_id_presence
    if role != 'patient' && patient.nil?
      errors.add(:secret_patient_id, 'は必須です')
    end
  end
end
