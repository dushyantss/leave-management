# Leave Management

Office needs a leave management software. Took too long to decide which ready made solution to use. Need to practice rails. So, here it is. Basic leave management.

## Setup
* bundle install

## Test
* bundle exec rails test

## Planned Improvements
* Add internationalization.
* Automatic optimized leave request creation based on given date range.
* Comments on LeaveRequests.
* Half day leaves.
* Optional holidays based on location.


# TODOs
* Make optional holidays pro-rated as well.
* Add proper time zone handling.
* Add custom validators for date.
* Add business logic for Leave, LeaveEarning, LeaveEarningConsumption and related Adjustment and OptionalHoliday. Also, the usage of Users and NotificationGroups.
* Add audited gem to all relevant models.
* Add kaminari and ransack.
* [Add simple forms. The docs also kinda explain how to use bootstrap](https://github.com/plataformatec/simple_form)
* Add proper views and controller actions.
* Add authentication.
* Add authorization.
* [implement lock_version properly in forms](https://www.engineyard.com/blog/a-guide-to-optimistic-locking).

## Contribution Guidelines
* Please ensure that there are relevant tests in the Pull Request.
