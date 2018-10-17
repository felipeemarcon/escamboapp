class Site::HomeController < BackofficeController

  def index
    @categories = Category.all
  end
end
