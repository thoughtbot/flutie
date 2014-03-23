Flutie
======

[![Build Status](https://secure.travis-ci.org/thoughtbot/flutie.png)](http://travis-ci.org/thoughtbot/flutie)

Flutie is a Rails Engine that provides common `ActionView` view helpers.
It works with Rails > 3.0.

Previous versions created default application styles. We now use
[Bourbon](https://github.com/thoughtbot/bourbon) and
[Neat](https://github.com/thoughtbot/neat) styles.

Install
-------

Add Flutie to your Gemfile:

    gem 'flutie'

Helpers
-------

The `page_title` and `page_description` methods can be used like:

    <%= page_description %>
    <%= page_title %>

By default, Flutie will create empty tags:

    <meta name="description" content="">
    <title></title>

Define your page titles and descriptions using [Rails
internationalization][i18n]:

[i18n]: http://guides.rubyonrails.org/i18n.html

    en:
      projects:
        new:
          page_title:
            New Project
        edit:
          page_description:
            '%{project.description}'
          page_title:
            'Edit %{project}'

The `body_class` method can be used like:

    <body class="<%= body_class %>">

This will produce a string including the controller name and controller-action
name. For example, The `WidgetsController#show` action would produce:

    <body class="widgets widgets-show">

Anything which has been added via `content_for(:extra_body_classes)` will be
added to the end, for example:

    content_for(:extra_body_classes, 'special-page')
    <body class="<%= body_class %>">
    <body class="widgets widgets-show special-page">

Suggestions, Bugs, Refactoring?
-------------------------------

Please see CONTRIBUTING.md for details.

Credits
-------

![thoughtbot](http://thoughtbot.com/images/tm/logo.png)

Flutie is maintained and funded by [thoughtbot, inc](http://thoughtbot.com).

Thank you to all [the
contributors](https://github.com/thoughtbot/flutie/contributors)!

The names and logos for thoughtbot are trademarks of thoughtbot, inc.

License
-------

Flutie is Copyright © 2010-2014 thoughtbot. It is free software, and may be
redistributed under the terms specified in the LICENSE file.
