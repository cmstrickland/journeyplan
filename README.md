## prerequisites

built against postgresql >= 9.1 , so you will need a running postgresql server

- there is expected to be a postgresql superuser called 'rentify' with connection rights

typical steps to set this up

- install postgresql server
- as the postgresl server admin account (typically postgres) `createuser -s rentify`
- modify the connection rights in `pg_hba.conf` to allow trusted local access
  - e.g. include a line like this in`local   all    rentify                  trust`    _above_ the default entry  `local all all peer`

but this may vary according to your postgresql setup

once you have this

`rake db:create`
`rake db:migrate`

The app is built to use foreman so you can run it via `foreman start -f Procfile`

config variables should be set in ``.env``
there's a skeleton .env.example file provided, but you will need to add API keys to this


There is a small test suite built using Rspec + capybara - so once you have installed all the prerequistes you can exercise the unit and feature tests by simply running `rake`
