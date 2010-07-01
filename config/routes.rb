Rails.application.routes.draw do |map|

  resource :styleguides, :as => :styleguide, :controller => 'flutie/styleguides', :only => [:show]

end
