1. Разблокировать юзеров из France и Germany с положительным балансом

db.users.updateMany(
    { country: { $in: {'France', 'Germany'}},
        balance:{$gte: 0}},
    { $set: { is_blocked: null }} 
)

2. Вывести названия двух произвольных треков

db.tracks.aggregate([
    {$project: {title: 1, _id: 0} },
    { $sample: { size: 2 } }
])

3. Вывести юзеров, у которых есть треки

db.users.aggregate([
    {
        $lookup: {
            from: 'tracks',
            localField: '_id',
            foreignField: 'author_id',
            as: 'tracks'
        }
    },
    { $match: { tracks: {$ne: []} } }
])

4. Используя метод aggregate(), вывести ко-во юзеров без треков

db.users.aggregate([
    {
        $lookup: {
            from: 'tracks',
            localField: '_id',
            foreignField: 'author_id',
            as: 'tracks'
        }
    },
    { $match: { tracks: [] } },
    { $count: 'users'}
])