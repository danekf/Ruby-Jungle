class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASSWORD']
  def index
    @products = Category.order(id:).all
  end
end
