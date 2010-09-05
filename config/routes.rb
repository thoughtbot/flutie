Rails.application.routes.draw do

  resource :styleguides, :as => :styleguide, :controller => 'flutie/styleguides', :only => [:show]

end
