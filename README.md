# README

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

* ...



<%= form_with( model: [@user, @user.build_profile], local: true, url: profiles_path(:uid =>@user.id))  do |f| %>
  <%= render "shared/error" %>
  <div class="field">
    <%= f.label :first_name %><br/>
    <%= f.text_field :first_name %>
  </div>

  <div class="field">
    <%= f.label :last_name %><br/>
    <%= f.text_field :last_name %>
  </div>
    
  <div class="field">
    <%= f.label :phone_number %><br/>
    <%= f.text_field :phone_number %>
  </div>

  <div class="field">
    <%= f.label :address %><br/>
    <%= f.text_field :address %>
  </div>

  <div class="field">
    <%= f.label :date_of_birth %><br/>
    <%= f.text_field :date_of_birth %>
  </div>

  <div class="field">
    <%= f.submit %>     
  </div>
  
<% end %>




