class ResponsesController < ApplicationController
  skip_load_and_authorize_resource only: :create

  before_action :set_form, only: [:create]
  before_action :set_form_sector, only: [:create]

  # POST /responses
  def create
    authorize! :create, Response

    Response.transaction do
      @responses = Response.create!(responses_params)
      @form_sector.respond!
    end

    render json: @responses
  end

  private

  def set_form
    @form = Form.find(params[:form_id])
  end

  def set_form_sector
    @form_sector = @form.form_sectors.find_by(sector_id: @current_user.sector_id)
  end
  
  def current_ability
    @current_ability ||= ResponseAbility.new(@current_user, @form)
  end

  def responses_params
    perm_params = params.permit(responses: [:answer, :question_id]).require(:responses)
    perm_params.map { |response| response[:user_id] = @current_user.id }
    perm_params
  end
end