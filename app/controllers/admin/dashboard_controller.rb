class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"
  def show
    @productCount = Product.all
    @categoryCount = Category.all
  end
end
