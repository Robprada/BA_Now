class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # @experiences = Experience.all
    # sql_subquery = <<~SQL
    #   experiences.title @@ :query
    #   OR experiences.description @@ :query
    # SQL
    # return unless params[:query].present?

    # @experiences = Experience.where(sql_subquery, query: "%#{params[:query]}%")
    # @experiences = Experience.search_by_title_and_description(params[:query])

    if params[:query].present? && params[:query].length >= 1
      @experiences = Experience.search_by_title_and_description(params[:query])
    else
      @experiences = Experience.all
    end

    respond_to do |format|
      format.html # Render the default HTML view
      format.json { render json: { results: render_to_string(partial: "experiences", formats: [:html]) } }
    end
  end
end
