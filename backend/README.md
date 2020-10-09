# **Documentation**

## 0. Initialize
Do `get` request to https://crawling-veiled-achillobator.glitch.me/init to **empty** the whole the database and rebuild with some sample structure.

## 1. Users

- Get one user: `post` request to https://crawling-veiled-achillobator.glitch.me/users . Returns `500` failure when `id` does not exist in `users`.
```
{
    "id": "id001"
}
```

- Get all users: `get` request to https://crawling-veiled-achillobator.glitch.me/users-all

- Add/update user: `post` request to https://crawling-veiled-achillobator.glitch.me/users-edit 
**Attributes**: `id`, `name`, `age`, `badge`, `score`
```
{
    "id": "id001",
    "name": "Bob",
    "age": 13,
    "badge": {
        "milestoneA": "True"
    },
    "score": 90
}
```


## 2. Events

- Get one event: `post` request to https://crawling-veiled-achillobator.glitch.me/events . Returns `500` failure when `id` does not exist in `events`.
```
{
    "id": "id001"
}
```

- Get all events: `get` request to https://crawling-veiled-achillobator.glitch.me/events-all

- Add/update user: `post` request to https://crawling-veiled-achillobator.glitch.me/events-edit 
**Attributes**: `id`, `ageMax`, `ageMin`, `comment`, `dateDeadline`, `dateEvent`, `datePost`, `tag`, `thumbUrl`, `title`, `users`, `usersMax`
```
{
   "id": "id001"
   "ageMax":0,
   "ageMin":0,
   "dateDeadline":0,
   "dateEvent":0,
   "datePost":0,
   "id":"0",
   "tag":"0",
   "thumbUrl":"0",
   "title":"0",
   "users":0,
   "usersMax":0
}
```
