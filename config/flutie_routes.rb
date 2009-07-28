ActionController::Routing::Routes.draw do |map|

  map.resource :styleguide,
    :controller => 'flutie/styleguides',
    :only       => [:show]

end
