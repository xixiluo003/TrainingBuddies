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
