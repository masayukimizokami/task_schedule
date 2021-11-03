class SchedulesController < ApplicationController
  def index
    @scdls = Scdl.all
  end

  def new
    @scdls = Scdl.all
    @scdls = Scdl.new
  end

  def create
    @scdls = Scdl.new(params.require(:scdl).permit(:title, :start_day, :end_day, :all_day, :memo))
    if @scdl.save
      flash[:success]= "スケジュールを登録しました"
      redirect_to :schedules
    else
      flash[:delete]= "スケジュールを登録できませんでした"
      render "new"
    end
    @scdls = Scdl.all
  end
  
  def show
    @scdl = Scdl.find(params[:id])
    @scdls = Scdl.all
  end
  
  def edit
    @scdl = Scdl.find(params[:id])
    @scdls = Scdl.all
  end
  
  def update
    @scdl = Scdl.find(params[:id])
    if @scdl.update(params.require(:scdl).permit(:title, :start_day, :end_aday, :all_day, :memo))
      flash[:success] = "スケジュールを更新しました"
      redirect_to :schedules
    else
      flash[:delete]= "スケジュールを更新できませんでした"
      render "edit"
    end
    @scdls = Scdl.all
  end
  
  def destroy
    @scdl = Scdl.find(params[:id])
    @scdl.destroy
    flash[:delete]= "スケジュールを削除しました"
    redirect_to :scedules
  end

end
