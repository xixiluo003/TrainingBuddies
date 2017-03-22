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
  { user_id:1, workout_type:"Legs", workout_content:"Lunges, Squats, Box Jumps!" },
  { user_id:3, workout_type:"Core", workout_content:"Plank for 30 mins" }
])

# Event.destroy_all
# Event.create([
#   { start_event:nil, end_event:nil, location:"New York, New York" },
#   { start_event:nil, end_event:nil, location:"Rockville, Maryland" }
# ])
