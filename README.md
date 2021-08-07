# example-rails

See: https://docs.flyyer.io/guides/ruby/rails

For development, run:

```bash
bundle install
rails s
```

Then go to http://localhost:3000

---

Created with the settings for a minimal Ruby on Rails app:

```bash
rails new \
  --database sqlite3 \
  --minimal \
  --skip-keeps \
  --skip-action-mailer \
  --skip-action-mailbox \
  --skip-action-text \
  --skip-active-storage \
  --skip-puma \
  --skip-action-cable \
  --skip-sprockets \
  --skip-spring \
  --skip-listen \
  --skip-javascript \
  --skip-turbolinks \
  --skip-test \
  --skip-system-test \
  --skip-bootsnap \
  --skip-webpack-install \
  rails-example
```
