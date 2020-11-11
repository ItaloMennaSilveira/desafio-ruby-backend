class ShopsController < ApplicationController
  before_action :authenticate_user!

  def index
    @shops = Transaction.all.group_by(&:shop)
  end

  def upload_file
    file = File.open(params[:file][:file].path, 'r')

    processor = ::CNAB::Services::ProcessFile.new
    processor.call(file)

    redirect_to index_path
  end
end
