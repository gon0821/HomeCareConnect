class Patient < ApplicationRecord
  # PatientモデルがUserモデルを多数持つ（つまり一対多の関係）
  has_many :users, primary_key: :secret_id, foreign_key: :secret_patient_id
  # Patientモデルのインスタンスが生成される前に、generate_patient_idメソッドを実行する
  before_create :generate_secret_id

  private

  # ランダムな文字列を生成して、secret_idに代入する
  def generate_secret_id
    self.secret_id = SecureRandom.alphanumeric(8)
  end
end
