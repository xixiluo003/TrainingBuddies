#Make new Group event
<%= link_to "New Group Event", new_group_event_path(@group) %>
$.ajax({
  url: "/getevents",
  data: { group_id: group_id },
  method: "GET",
  dataType: "json"
}).success(function(eventData){
    console.log("*** ajax success ***");
    console.dir(eventData);
    // displayEventData(eventData);
}).error(function(){
    console.log("*** ajax error ***");
    // handleAjaxError(jsonData);
});

@events.each do |event|
  event[:url] = "/groups/" + @group.id.to_s + "/events/" + event.id.to_s
end

<div class="ui grey basic animated button" tabindex="0" id="loginButton">
  <%= f.submit "Log in", class: "ui visible content" %>
  <div class="hidden content">
    <i class="right arrow icon"></i>
  </div>


  <%= form_for [user_id, group_id, @usersingroups], :html => {:class => 'ui form'} do |f| %>
    <div class="actions">
      <%= f.submit "Submit", class: "ui basic teal button", id: "addbbuddyButton" %>
    </div>

    <% end %><br>


    <%= form_for @usersingroups, {:url => url_for(:controller => "users", :action => "add"), :remote => true, :html => {:class => 'ui form'}} do |f| %>

      <div class="ui">
        <%= select("usersingroups", "user_id", @all_users.all.map { |r| [ r.email, r.id ] }, { :include_blank => true }, { :placeholder => "Select Buddy" }) %><br/>
      </div>

      <div class="ui">
        <%= select("usersingroups", "group_id", @usergroups.all.map { |r| [ r.group_name, r.id ] }, { :include_blank => true }) %><br/>
      </div>

      <div class="actions">
        <%= f.submit "Submit", class: "ui basic teal button", id: "addbbuddyButton" %>
      </div>

      <% end %><br>
      
      <% @events.each do |event| %>
        <%= User.find(event.user_id).first_name %></br>
        <%= event.title %></br>
        <%= event.event_location %></br>
        <%= link_to "Edit", edit_user_event_path(current_user, event) %></br>
      <% end %>
      <br />
