# Omniauth Avaza &nbsp;![Build Status](https://github.com/kalpana0795/omniauth-avaza/actions/workflows/main.yml/badge.svg) [![Gem Version](https://badge.fury.io/rb/omniauth-avaza.svg)](https://rubygems.org/gems/omniauth-avaza) 
This gem contains the Avaza strategy for OmniAuth.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-avaza'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install omniauth-avaza

## Usage

`OmniAuth::Strategies::Avaza` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :avaza, ENV['AVAZA_CLIENT_ID'], ENV['AVAZA_CLIENT_SECRET']
end
```

## Authentication Hash

Here's an example Authentication Hash available in `request.env['omniauth.auth']`:

```ruby
{
  "provider": "avaza",
  "uid": 65869,
  "info": {
    "name": "Yerby Moore",
    "email": "ym@example.com",
    "first_name": "Yerby",
    "last_name": "Moore",
    "phone": '9012348567'
  },
  "credentials": {
    "token": "697720xaavd...",
    "refresh_token": "6182a91...",
    "expires_at": 1691974463,
    "expires": true
  },
  'extra': ...
}
```
<details>

<summary>Full Authentication Hash</summary>

```ruby
{
  "provider": "avaza",
  "uid": 12869,
  "info": {
    "name": "Yerby Moore",
    "email": "ym@example.com",
    "first_name": "Yerby",
    "last_name": "Moore",
    "phone": '9012348567'
  },
  "credentials": {
    "token": "697720xaavd...",
    "refresh_token": "6182a91...",
    "expires_at": 1691974463,
    "expires": true
  },
  "extra": {
    "raw_info": {
      "user_id": 12869,
      "account_idfk": 134774,
      "email": "ym@example.com",
      "firstname": "Yerby",
      "lastname": "Moore",
      "position_title": null,
      "phone": '9012348567',
      "mobile": null,
      "time_zone": "India Standard Time",
      "iana_timezone": "Asia/Kolkata",
      "is_team_member": true,
      "company_idfk": null,
      "company_name": null,
      "default_billable_rate": null,
      "default_cost_rate": null,
      "monday_available_hours": 8,
      "tuesday_available_hours": 8,
      "wednesday_available_hours": 8,
      "thursday_available_hours": 8,
      "friday_available_hours": 8,
      "saturday_available_hours": null,
      "sunday_available_hours": null,
      "roles": [
        {
          "role_code": "Admin",
          "role_name": "Administrator"
        },
        {
          "role_code": "PM",
          "role_name": "Portfolio Manager"
        },
        {
          "role_code": "ScheduleUser",
          "role_name": "Schedule User"
        }
      ],
      "tags": []
    }
  }
}
```
</details>

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kalpana0795/omniauth-avaza. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/kalpana0795/omniauth-avaza/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Omniauth::Avaza project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kalpana0795/omniauth-avaza/blob/master/CODE_OF_CONDUCT.md).
