## README

[Production](https://techhire-registration.herokuapp.com)

This app uses

* postgres
* memcached (via dalli)
* AWS S3
* Bing Geocode API
* Sengrid

For AWS/Bing/Sendgrid credentials, you'll need to get the `application.yml` file from someone on the team.

To Seed the DB

```
rake db:seed
rake populate_form
```

