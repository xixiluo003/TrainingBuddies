Group.destroy_all
Group.create([
  { group_name:"XiXi-Walker-Tom", group_leader:"XiXi", group_type:"Weekend Meetup", group_goal:"We want to learn more about how to get better at climbing!" },
  { group_name:"Tom-Alain", group_leader:"Tom", group_type:"Monday Group", group_goal:"Tom can help Alain with his running goal" }
])


UserGroup.destroy_all
UserGroup.create([
  { user_id:1, group_id:1, user_type:"Buddy" },
  { user_id:2, group_id:1, user_type:"Buddy" },
  { user_id:3, group_id:1, user_type:"Buddy" },
  { user_id:3, group_id:2, user_type:"Trainer" },
  { user_id:4, group_id:2, user_type:"Buddy" }
])

Workout.destroy_all
Workout.create([
  { user_id:1, workout_name:"1 hour legs with some core", workout_type:"Legs", workout_content:"Lunges, Squats, Box Jumps!" },
  { user_id:3, workout_name:"1.5 hour whole budy core intensive", workout_type:"Core", workout_content:"Plank for 30 mins" }
])

Post.destroy_all
Post.create([
  { user_id:1, group_id:1, title:"Does Someone what to workout?", content:"Hi I'm climbing tomorrow night. and want to some legs. Does anyone want to join me?" },
  { user_id:3, group_id:1, title:"This is great!", content:"Hopefully we can get ready for this trip coming up!" },
  { user_id:4, group_id:2, title:"Can you help?", content:"I don't know what I'm doing here. " },
  { user_id:3, group_id:2, title:"Check this out", content:" Check out this cool thing! " },
])

Comment.destroy_all
Comment.create([
  { user_id:2, post_id:1, content:"I want to workout too! Let's do it!" },
  { user_id:1, post_id:2, content:"Yes! I'm very excited. I hope to get on my project!" },
  { user_id:3, post_id:3, content:"Yea we can talk when we meet up. When are you going?" },
  { user_id:4, post_id:3, content:"I can go tonight!" },
])

# Event.destroy_all
# Event.create([
#   { start_event:nil, end_event:nil, location:"New York, New York" },
#   { start_event:nil, end_event:nil, location:"Rockville, Maryland" }
# ])
