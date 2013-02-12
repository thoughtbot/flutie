Flutie
======

[![Build Status](https://secure.travis-ci.org/thoughtbot/flutie.png)](http://travis-ci.org/thoughtbot/flutie)

Flutie provides extra ActionView view helpers for use with Rails applications.  Previous versions created default application styles.

Please look to [Bourbon](https://github.com/thoughtbot/bourbon) and [Neat](https://github.com/thoughtbot/neat) gems for style defaults now.

Installation & Upgrading
------------------------

Flutie is a Railtie meant for use with Rails. It works with versions of Rails greater than 3.0.

Flutie is recommended to be run as a gem and included in your Gemfile:

    gem 'flutie'

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

Suggestions, Bugs, Refactoring?
-------------------------------

Please see CONTRIBUTING.md for details.

Credits
-------

![thoughtbot](http://thoughtbot.com/images/tm/logo.png)

Flutie is maintained and funded by [thoughtbot, inc](http://thoughtbot.com/community)

Thank you to all [the contributors](https://github.com/thoughtbot/flutie/contributors)!

The names and logos for thoughtbot are trademarks of thoughtbot, inc.

License
-------

Flutie is Copyright © 2010-2013 thoughtbot. It is free software, and may be redistributed under the terms specified in the LICENSE file.
