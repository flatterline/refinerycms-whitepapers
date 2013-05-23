# Refinery CMS Whitepapers

A Refinery CMS Engine for extending Pages with attached whitepapers.

## Requirements

This version of refinerycms-whitepapers supports Rails 3.2.x and Refinery CMS ~> 2.0.10.

## Features

* Attach an uploaded file to a page as a whitepaper.
* Page body can be used to describe the whitepaper, or provide an abstract.
* Upload a whitepaper from the page tab, without disrupting the page being created/updated.
* Whitepaper can be downloaded.

## Installation

Add the following to your ```Gemfile```:

    gem 'refinerycms-whitepapers', '~> 0.1.0'

Once it's added to your ```Gemfile```, run the following commands:

    bundle install
    rails g refinery:whitepapers

Add the following to ```refinery/pages/show.html.erb```:

    <%= render '/refinery/whitepapers/show' %>

## Todo list

* Capture email address on attempt to download. Use cookie to allow multiple whitepaper downloads without asking for email again?

## License

Refinery CMS Whitepapers engine is released under the [MIT license](http://www.opensource.org/licenses/MIT).
