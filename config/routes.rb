Rails.application.routes.draw do

  root to: 'visitors#dashboard'

  get 'signin' => 'users#signin'

  post 'check_user' => 'users#check_user'

  post 'do_signin' => 'users#do_signin'

  get 'signout' => 'users#signout'

  get 'profile' => 'visitors#profile'

  post 'create' => 'visitors#create'

end
