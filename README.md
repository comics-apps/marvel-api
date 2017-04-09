# Marvel::Api

A simple Marvel API client for Ruby, inspired by the koala's gem style.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'marvel-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install marvel-api

## Usage

```ruby
public_key = 'foo'
private_key = 'bar'
options = {}
service = Marvel::Api.new(public_key, private_key, **options)
```
 
Gem provide universal method which allows you to create custom call to API:

```ruby
service.api_call(path, args, options)
```

* path - append to `http://comicvine.gamespot.com/api/`
* args - query params
* options - options for http service class

Available methods:

* `characters(args)`
* `character(character_id, args)`
* `character_comics(character_id, args)`
* `character_events(character_id, args)`
* `character_series(character_id, args)`
* `character_stories(character_id, args)`
* `comics(args)`
* `comic(comic_id, args)`
* `comic_characters(comic_id, args)`
* `comic_events(comic_id, args)`
* `comic_series(comic_id, args)`
* `comic_stories(comic_id, args)`
* `creators(args)`
* `creator(creator_id, args)`
* `creator_comics(creator_id, args)`
* `creator_events(creator_id, args)`
* `creator_series(creator_id, args)`
* `creator_stories(creator_id, args)`
* `events(args)`
* `event(event_id, args)`
* `event_characters(event_id, args)`
* `event_comics(event_id, args)`
* `event_creators(event_id, args)`
* `event_series(event_id, args)`
* `event_stories(event_id, args)`
* `series(args)`
* `serie(serie_id, args)`
* `serie_characters(serie_id, args)`
* `serie_comics(serie_id, args)`
* `serie_creators(serie_id, args)`
* `serie_events(serie_id, args)`
* `serie_stories(serie_id, args)`
* `stories(args)`
* `story(story_id, args)`
* `story_characters(story_id, args)`
* `story_comics(story_id, args)`
* `story_creators(story_id, args)`
* `story_events(story_id, args)`
* `story_series(story_id, args)`

Check official API docs what arguments you can use: https://developer.marvel.com/docs

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Krzysztof Wawer/marvel-api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

