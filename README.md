## README

[ ![Codeship Status for turingschool-projects/techhire](https://codeship.com/projects/a49ad3c0-2f05-0133-6714-16f8b3594537/status?branch=master)](https://codeship.com/projects/99278)

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

