class MedicationsController < ApplicationController
  #　ログインしていないユーザーをログインページに促す
  before_action :authenticate_user!
  # データを新規作成するためのフォームを表示する
  def new
    @medication = current_patient.medications.build
  end

  # データを新規作成し、DBに保存する
  def create
    @medication = current_patient.medications.build(medication_params)

    respond_to do |format|
      if @medication.save
        format.html {redirect_to patient_medications_path, notice: 'お薬を登録しました'}
      else
        format.html {render :new, status: :unprocessable_entity}
      end
    end
  end

  # 全てのデータを取得し、一覧表示する
  def index
    @medications = current_patient.medications
  end

  # 特定のデータを取得し、編集するためのフォームを表示する
  def edit
    @medication = current_patient.medications.find(params[:id])
  end

  # データを更新する
  def update
    @medication = current_patient.medications.find(params[:id])

    respond_to do |format|
      if @medication.update(medication_params)
        format.html {redirect_to patient_medications_path, notice: 'お薬情報を更新しました'}
      else
        format.html {render :edit, status: :unprocessable_entity}
      end
    end
  end

  # データを削除する
  def destroy
    @medication = current_patient.medications.find(params[:id])
    @medication.destroy

    respond_to do |format|
      format.html {redirect_to patient_medications_path, notice: 'お薬を削除しました', status: :see_other}
    end
  end

  private
  # ストロングパラメーター
  def medication_params
    params.require(:medication).permit(:name, :dosage, :start_date, :end_date, :memo, :time1, :time2, :time3, :time4, :time5)
  end
end
