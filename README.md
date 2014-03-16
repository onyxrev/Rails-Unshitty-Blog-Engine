Blogocalypse Blog Engine for Rails
==================================

*Status: Work in Progress*

Oh great. Another blog engine for Rails.

Most (all?) blog engines for Rails try to provide a drop-in, mountable appendage that kinda hangs off your app like a limp noodle.

This blog engine does provide mountable routes but also aims to expose bloggy components that you can use throughout your app.

It also tries to be as unopinionated about styles as possible because, let's face it, if you wanted to integrate a vestigial layout and css framework with your app you'd probably just use Wordpress.

One of the major driving factors for me making this is that it's really hard to add blog functionality to a Spree application.  Stuff conflicts all over the place.  So if you're looking for a blog solution for your Spree app, this should be a great candidate.

KISS
----

One of the mantras of this project is to keep it simple.  I've had way too many engines conflict betwen kaminari and will_paginate, devise and authlogic, yada and yada.  This blog engine will keep it simple to avoid falling into disrepair and to avoid making your life difficult.

* No pagination.
 * Nobody will complain if they have to see all your posts.  It's a blog.  And if you have a million posts you should be using a different approach altogether.
* Minimal javascript.
 * Turbolinks is great.
* No css framework at all.
 * Does provide namespaced css classes and IDs for you. You're an adult; you can style your own blog.  It'll be a better fit with your existing app as a result.
