Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  post 'questions/:id/:answer_id', to: "questions#create_user_answer", as: "create_user_answer"

  resources :questions, only: [:index, :show]

  resources :users do
    get 'questions', to: "questions#user_questions", as: "questions"
    resources :questions, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
