# BetterBook

https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Requirements
  - Use PostgreSQL for your database from the beginning (not SQLite3), that way your deployment will go much more smoothly.
  - Users must sign in to see anything except the sign in page.
  - User sign-in should use the Devise gem. Devise gives you all sorts of helpful methods so you no longer have to write your own user passwords, sessions, and #current_user methods.
  - Users can send Friend Requests to other Users.
  - A User must accept the Friend Request to become friends.
  - The Friend Request shows up in the notifications section of a User’s navbar.
  - Users can create Posts (text only to start).
  - Users can Like Posts.
  - Users can Comment on Posts.
  - Posts should always display with the post content, author, comments and likes.
  - Treat the Posts Index page like the real Facebook’s “Timeline” feature – show all the recent posts from the current user and users she is friends with.
  - Users can create a Profile with their personal information and a photo. You can use Gravatar for this photo.
  - The User Show page contains their Profile information, photo, and Posts.
  - The Users Index page lists all users and buttons for sending Friend Requests to those who are not already friends or who don’t already have a pending request.
  - Sign in should use OmniAuth to allow a user to sign in with their real Facebook account. See the RailsCast on FB authentication with Devise for a step-by-step look at how it works.
  - Set up a mailer to send a welcome email when a new user signs up. Use the letter_opener gem (see docs here) to test it in development mode.
  - Deploy your App to a hosting provider.
  - Set up an email provider and start sending real emails.
  Extra Credit
  - Make posts also allow images (either just via a URL or, more complicated, by uploading one).
  - Use the Active Storage to allow users to upload a photo to their profile.
  - Make your post able to be either a text OR a photo by using a polymorphic association (so users can still like or comment on it while being none-the-wiser).
  - Style it up nicely!
