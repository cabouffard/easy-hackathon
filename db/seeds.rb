# NOTE(cab) This is a temporary user
# We might not want to run this in PROD.
user = User.create(email: 'admin@admin.com', password: 'password123',
            first_name: 'charles', last_name: 'bouff', country: 'canada',
            address: '123 route', city: 'ste-anne', zip: 'j0r')
