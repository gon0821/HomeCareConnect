class MedicationsController < ApplicationController
  # データを新規作成するためのフォームを表示する
  def new
    @medication = Medication.new
  end

  # データを新規作成し、DBに保存する
  def create
    @medication = Medication.new(medication_params)

    if @medication.save
      redirect_to @medication # showアクションにリダイレクト
    else
      render :new # newアクションのviewを表示
    end
  end

  # 全てのデータを取得し、一覧表示する
  def index
    @medications = Medication.all
  end

  private
  # ストロングパラメーター
  def medication_params
    params.require(:medication).permit(:name, :dosage, :start_date, :end_date, :memo)
  end
end
