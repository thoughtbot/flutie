Flutie
======

[![Build Status](https://secure.travis-ci.org/thoughtbot/flutie.png)](http://travis-ci.org/thoughtbot/flutie)

Basic, default styles for rails applications

We also have a [Bourbon](https://github.com/thoughtbot/bourbon) gem available, which can be used to extend flutie with a set of vanilla sass mixins.

Installation & Upgrading
------------------------

Flutie is a Rails engine. It works with versions of Rails greater than 3.0.

Flutie is recommended to be run as a gem and included in your Gemfile:

    gem "flutie"

### Rails 3.1 & Rails 3.2

After you've bundled, if you are using rails 3.1 or greater with asset pipelining enabled, simply add:

    @import 'flutie';

as a sass import in the application stylesheet manifest (app/assets/stylesheets/application.css.scss).

If this is a new Rails 3.1 or 3.2 project you will need to rename the application.css manifest to application.css.scss so it is processed
by the asset pipeline and sass to perform the @import.

### Rails 3.0

After you've bundled, run the installer:

    rake flutie:install

The installer will copy the Flutie stylesheets sass into public/stylesheets/sass/flutie, and a static flutie.css into public/stylesheets/ in your app.

Once Flutie is installed, with your application running (not in production environment) you can browse to /styleguides.  This will present you with many standard markup elements that are present in a Rails application, in your default application layout.

Click on the "Default styles" link to view the same markup with a barebones layout that only contains the Flutie stylesheets. Click on "Application styles" to view the markup in your application layout.

To upgrade, bump the gem version in your Gemfile, and then run `rake flutie:install` again to get the latest changes moved into your application.

Flutie registers a :flutie shortcut for stylesheets, so in your layout you can do...

    <%= stylesheet_link_tag :flutie, 'admin', :cache => true %>

...this will include all the flutie stylesheets, then the 'admin' stylesheet, and it will cache them all into one file.

#### Sass

If you use Sass in your application, the flutie stylesheets are also available as scss files, installed in public/stylesheets/sass/flutie.  These files can be imported into your own sass files for use with the following:

    @import "flutie/flutie";

You'll want to import flutie before any of your own styles so that you can do things like extend your classes with flutie classes.

Helpers
-------

Flutie provides several helper methods for layouts as well.

#### page_title

The `page_title` method can be used like:

    <title><%= page_title %></title>

By default, it will produce results like:

    <title>Appname : page title</title>

* "App name" comes from the module name of the rails application created by your app, i.e. `Appname::Application` will produce "Appname"
* "page" comes from trying `content_for(:page_title)` and assumes you are using `content_for` with `:page_title` symbol on your pages.
* The separator defaults to " : "

These can be overridden by passing an options hash including `:app_name`, `:page_title_symbol` and `:separator` hash keys, ie:

    content_for(:site_page_title, 'My title of my page')
    page_title(:app_name => 'My app name', :page_title_symbol => :site_page_title, :separator => " | ")
    => "My app name | My title of my page"

#### body_class

The `body_class` method can be used like:

    <body class="<%= body_class %>">

This will produce a string including the controller name and controller-action name.  For example, The WidgetsController#show action would produce:

    <body class="widgets widgets-show">

Anything which has been added via `content_for(:extra_body_classes)` will be added to the end, for example:

    content_for(:extra_body_classes, 'special-page')
    <body class="<%= body_class %>">
    <body class="widgets widgets-show special-page">

Custom Styles
-------------

To add custom styles to the styleguide add partials to the app/views/styleguides directory. For example:

    app/views/styleguides/_todo_item.erb:

    <ol>
      <li class="todo">This is a todo item</li>
    </ol>

Plugin authors can also add to the styleguide by ensuring that their view path is in `ActionController::Base.view_paths` and by placing a partial under the styleguides directory. For example:

    ActionController::Base.append_view_path(File.join(File.dirname(__FILE__), 'views'))

    my_awesome_plugin/views/styleguides/_pagination.erb:

    <div class="pagination">
      <a href="#prev">Previous</a>
      <a href="#next">Next</a>
    </div>

Suggestions, Bugs, Refactoring?
-------------------------------

Fork away and create a [Github Issue](http://github.com/thoughtbot/flutie/issues). Please don't send pull requests.

Please see CONTRIBUTING.md for details.

Development
-----------

The actual stylesheet source files are sass, so edit the files in app/assets/stylesheets/.
To rebuild the static flutie.css file, you can run:

    sass --update app/assets/stylesheets/_flutie.scss:public/stylesheets/flutie.css

You can also run a local server which will allow you to view the flutie styleguide:

    ruby server.rb

Browsing to localhost at the port output by the above command will show you the styleguide.

Credits
-------

![thoughtbot](http://thoughtbot.com/images/tm/logo.png)

Flutie is maintained and funded by [thoughtbot, inc](http://thoughtbot.com/community)

Thank you to all [the contributors](https://github.com/thoughtbot/flutie/contributors)!

The names and logos for thoughtbot are trademarks of thoughtbot, inc.

License
-------

Flutie is Copyright © 2010-2011 thoughtbot. It is free software, and may be redistributed under the terms specified in the LICENSE file.
