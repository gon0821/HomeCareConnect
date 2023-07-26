class MedicationsController < ApplicationController
  # データを新規作成するためのフォームを表示する
  def new
    @medication = Medication.new
  end

  # データを新規作成し、DBに保存する
  def create
    @medication = Medication.new(medication_params)

    respond_to do |format|
      if @medication.save
        format.html {redirect_to medications_path, notice: 'お薬を登録しました'}
      else
        format.html {render :new, status: :unprocessable_entity}
      end
    end
  end

  # 全てのデータを取得し、一覧表示する
  def index
    @medications = Medication.all
  end

  # 特定のデータを取得し、編集するためのフォームを表示する
  def edit
    @medication = Medication.find(params[:id])
  end

  # データを更新する
  def update
    @medication = Medication.find(params[:id])

    respond_to do |format|
      if @medication.update(medication_params)
        format.html {redirect_to medications_path, notice: 'お薬情報を更新しました'}
      else
        format.html {render :edit, status: :unprocessable_entity}
      end
    end
  end

  # データを削除する
  def destroy
    @medication = Medication.find(params[:id])
    @medication.destroy

    respond_to do |format|
      format.html {redirect_to medications_path, notice: 'お薬を削除しました', status: :see_other}
    end
  end

  private
  # ストロングパラメーター
  def medication_params
    params.require(:medication).permit(:name, :dosage, :start_date, :end_date, :memo)
  end
end
