class JobsController < ApplicationController
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, site_admin: :all

  def index
    if params[:query].blank?
      @jobs = JobPost.all
    else
      
      JobPost.import
      @jobs = JobPost.search( params[:query] ).records.to_a
    end
  end

  def show
    @job = JobPost.find(params[:id])
    @job.increment(:views)
    @job.save
  end

  def new
    @job = JobPost.new
  end

  def create
    @job = JobPost.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'New job was successfully saved.'}
      else
        format.html{ render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to jobs_url, notice: 'Job was successfully updated.'}
      else
        format.html{ render :edit}
      end
    end
  end

  def edit
  end

  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
    end
  end

  private

  def job_params
    params.require(:job_post).permit(:title,
                                     :description,
                                     :city,
                                     :state,
                                     :company
                                    )
  end

end
