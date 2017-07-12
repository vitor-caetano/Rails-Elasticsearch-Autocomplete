# Rails Elasticsearch Autocomplete

[Frontend: Elasticsearch Angular Autocomplete](https://github.com/EricLondon/Elasticsearch-Angular-Autocomplete)

Setup:
```

# install/run elasticsearch
brew install elasticsearch
brew services start elasticsearch

# checkout project
git clone git@github.com:EricLondon/Rails-Elasticsearch-Autocomplete.git
cd Rails-Elasticsearch-Autocomplete

# install gems
bundle install

# setup database
rake db:create && rake db:migrate

# create elasticsearch index via rails console
rails c
> Person.__elasticsearch__.create_index! force: true

# start sidekiq
sidekiq

# create sample data
rake import:people

```

Testing via cURL:
```
curl -s 'http://localhost:3000/api/people/auto_complete?q=eric' | python -m json.tool
[
    {
        "payload": {
            "first_name": "Erianthus",
            "id": 32176,
            "last_name": "Eric"
        },
        "score": 1.0,
        "text": "Erianthus Eric"
    },
    {
        "payload": {
            "first_name": "Ericaceae",
            "id": 32179,
            "last_name": "ericaceous"
        },
        "score": 1.0,
        "text": "Ericaceae ericaceous"
    },
    {
        "payload": {
            "first_name": "Ericales",
            "id": 32180,
            "last_name": "ericetal"
        },
        "score": 1.0,
        "text": "Ericales ericetal"
    },
    {
        "payload": {
            "first_name": "Erick",
            "id": 32184,
            "last_name": "ericoid"
        },
        "score": 1.0,
        "text": "Erick ericoid"
    },
    {
        "payload": {
            "first_name": "eric",
            "id": 32177,
            "last_name": "Erica"
        },
        "score": 1.0,
        "text": "eric Erica"
    }
]
```

The guts of the elasticsearch integration code exist in the [Person model](https://github.com/EricLondon/Rails-Elasticsearch-Autocomplete/blob/master/app/models/person.rb).
