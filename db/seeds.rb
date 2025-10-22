# Destroy old data to avoid duplicates
Enrollment.destroy_all
Assignment.destroy_all
Lesson.destroy_all
Course.destroy_all
User.destroy_all

# --- Users ---
users = [
  {name: "Alice", email: "alice@example.com", role: "student"},
  {name: "Bob", email: "bob@example.com", role: "student"},
  {name: "Carol", email: "carol@example.com", role: "teacher"}
]

users = users.map { |u| User.create!(u) }

# --- Courses ---
courses = [
  {title: "Ruby on Rails", description: "Learn Rails from scratch"},
  {title: "JavaScript Basics", description: "Intro to JS"}
]

courses = courses.map { |c| Course.create!(c) }

# --- Lessons ---
lessons = [
  {title: "Rails Models", content: "Understanding models", course: courses[0]},
  {title: "Rails Controllers", content: "Understanding controllers", course: courses[0]},
  {title: "JS Variables", content: "Learn JS variables", course: courses[1]}
]

lessons.each { |l| Lesson.create!(l) }

# --- Assignments ---
assignments = [
  {title: "Build a Blog App", due_date: Date.today + 7, course: courses[0]},
  {title: "JS Quiz", due_date: Date.today + 3, course: courses[1]}
]

assignments.each { |a| Assignment.create!(a) }

# --- Enrollments ---
Enrollment.create!(user: users[0], course: courses[0])
Enrollment.create!(user: users[1], course: courses[0])
Enrollment.create!(user: users[1], course: courses[1])
Enrollment.create!(user: users[0], course: courses[1])
Enrollment.create!(user: users[2], course: courses[0]) # teacher enrolled too if needed
