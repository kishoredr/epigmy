# Epigmy

> **Archived — October 2015.** This project is not maintained, does not run on
> modern systems, and should not be deployed. It is kept as a historical record.

An early Ruby on Rails learning project: the beginnings of a banking / customer
records system. Development started on 2 October 2015 and stopped on 4 October
2015. It never reached a working state.

## Status

This is a `rails new` skeleton with two database migrations added. There are no
routes, no controllers, no views and no business logic — the application cannot
serve a page.

| | |
|---|---|
| Framework | Rails 4.2.4 (end-of-life, unpatched since 2017) |
| Ruby | 2.2.x era |
| Database | SQLite 3 |
| Commits | 1 |
| Working features | None |

## What was actually built

Two migrations sketching out the intended data model:

**`customers`** — [`db/migrate/20151002131755_create_customers.rb`](db/migrate/20151002131755_create_customers.rb)

Account details (unique number, account number, account type, loan account
number, balance, open date, active flag), customer details (name, gender,
address, phone, alternate phone, email, date of birth) and nominee details
(name, relation, date of birth, address).

**`employees`** — [`db/migrate/20151004073526_create_employees.rb`](db/migrate/20151004073526_create_employees.rb)

Employee ID, name, date of birth, gender, address, email, phone, alternate
phone and date of joining.

Alongside these, `Customer` and `Employee` model classes exist but are empty —
no validations, no associations, no methods.

## Known problems

These are documented rather than fixed, because fixing them would not make the
project usable.

- **The database was never built.** [`db/schema.rb`](db/schema.rb) records the
  `customers` table with only `created_at` and `updated_at` — none of the real
  columns — and has no `employees` table at all. Neither migration ever ran
  successfully against a database.

- **The customers migration had a syntax error.** A stray `]` on the
  `account_balance` line (`t.integer :account_balance, :limit => 10]`) made the
  file invalid Ruby, which is why it never ran. This has since been corrected so
  the file at least parses; everything else is as it was written in 2015.

- **`therubyracer` cannot be installed on Apple Silicon.** Its `libv8`
  dependency has no arm64 build and will not compile. This alone prevents
  `bundle install` from completing on any modern Mac.

- **Rails 4.2 does not run on Ruby 3.x**, and requires roughly Ruby 2.2–2.3 —
  both long past end-of-life themselves.

- **No security support.** Rails 4.2 stopped receiving security patches in 2017.
  Numerous published CVEs affect this version. It must not be exposed to a
  network.

- **Development and test `secret_key_base` values are committed** in
  [`config/secrets.yml`](config/secrets.yml). Harmless for an app that was never
  deployed, but not a practice to repeat.

## If you want to revive the idea

Do not migrate this code — start a new project. The only original work here is
roughly thirty lines of column definitions in the two migrations above, and they
are easier to read and retype than to port. A modern Rails version, a supported
Ruby, and PostgreSQL would be a better foundation than anything this repository
provides.
