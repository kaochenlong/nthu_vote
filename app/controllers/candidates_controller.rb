class CandidatesController < ApplicationController
  before_action :find_candidate, only:[:edit, :update, :destroy]

  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      flash[:notice] = "新增候選人成功"
      redirect_to candidates_path
    else
      #...
    end
  end

  def edit
  end

  def update
    if @candidate.update_attributes(candidate_params)
      redirect_to candidates_path, notice:'更新成功'
    else
      #...
    end
  end

  def destroy
    @candidate.destroy
    redirect_to candidates_path, notice:'已刪除'
  end

  private
  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
    redirect_to candidates_path, notice: '找不到人' if not @candidate
  end

  def candidate_params
    params.require(:candidate).permit(:name)
  end
end
