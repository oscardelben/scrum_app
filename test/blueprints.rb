require 'machinist/active_record'

Story.blueprint do
  title  { "Learn climbing" }
  points { 1 }
  state  { :backlog }
end
