class ReportsController < ApplicationController
  def index
    @reports = Report.all.order(position: :asc)
  end
end
