# NOTE(cab) This is a temporary user
# We might not want to run this in PROD.
user = User.create(email: 'admin@admin.com', password: 'password123',
            first_name: 'charles', last_name: 'bouff', country: 'canada',
            address: '123 route', city: 'ste-anne', zip: 'j0r')

team = Team.create(name: 'Best team')
event = Event.create(title: 'Best Event', description: 'best desc',
             duration: '10h', date: DateTime.now)

team.users << user
event.teams << team
# event_user = TeamUsers.create(team: team, user: user)
