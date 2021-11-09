Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about' => "homes#about"
  
end
