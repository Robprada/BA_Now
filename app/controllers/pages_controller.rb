class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @experiences = Experience.all
    # sql_subquery = <<~SQL
    #   experiences.title @@ :query
    #   OR experiences.description @@ :query
    # SQL
    return unless params[:query].present?

    # @experiences = Experience.where(sql_subquery, query: "%#{params[:query]}%")
    @experiences = Experience.search_by_title_and_description(params[:query])
  end
end
