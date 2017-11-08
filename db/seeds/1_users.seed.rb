users = [
    {
        name: 'Илья',
        surname: 'Гордиенко',
        email: 'user.1.@user.com',
        password: '123123'
    },
    {
        name: 'Кирилл',
        surname: 'Семкин',
        email: 'user.2.@user.com',
        password: '123123'
    }
]

users.each do |params|
  User.create!(params)
end
