User.create(full_name: 'Admin',
            email: 'admin@example.com',
            password: '123456',
            admin: true) if User.where(admin: true).blank?
