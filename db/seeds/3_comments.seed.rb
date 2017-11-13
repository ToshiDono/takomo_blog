comments = [
    {
        body: 'Комментарий 1 к статье 1 первого пользователя.',
        user_id: 1,
        article_id: 1
    },
    {
        body: 'Комментарий 2 к статье 1 первого пользователя.',
        user_id: 2,
        article_id: 1
    },
    {
        body: 'Комментарий 3 к статье 1 первого пользователя.',
        user_id: 1,
        article_id: 1
    },
    {
        body: 'Комментарий 1 к статье 2 второго пользователя.',
        user_id: 1,
        article_id: 5
    },
    {
        body: 'Комментарий 2 к статье 2 второго пользователя.',
        user_id: 1,
        article_id: 5
    },
    {
        body: 'Комментарий 3 к статье 2 второго пользователя.',
        user_id: 2,
        article_id: 5
    },
    {
        body: 'Комментарий 4 к статье 2 второго пользователя.',
        user_id: 1,
        article_id: 5
    }
]

comments.each do |params|
  Comment.create!(params)
end
