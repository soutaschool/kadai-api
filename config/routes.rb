Rails.application.routes.draw do
  mount Base::API => '/' do
    collection do
      delete 'destroy_all'
    end
  end
end
