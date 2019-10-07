# Leave Management

Office needs a leave management software. Took too long to decide which ready made solution to use. Need to practice rails. So, here it is. Basic leave management.

## Setup
* bundle install

## Test
* bundle exec rails test

## Planned Improvements
* Different optional holidays for different offices.
* Add internationalization.
* Automatic optimized leave request creation based on given date range.
* Comments on LeaveRequests.
* Half day leaves.
* Optional holidays based on location.


# TODOs
* Rename User model to Employee. Then create a separate User model whose sole purpose is to use the system and thus store the credentials and other system related details, if any, and not any business details. We will also move the user type(normal, admin) to this model. We will alias employee attribute to employment_details.
* Use Rational class for LeaveEarning and LeaveConsumption calculation as the values would be in weird decimals otherwise.
* Add proper time zone handling.
* Add custom validators for date.
* Add business logic for Leave, LeaveEarning, LeaveConsumption and related Adjustment and OptionalHoliday. Also, the usage of Employees and NotificationGroups.
* Add audited gem to all relevant models.
* Add kaminari and ransack.
* [Add simple forms. The docs also kinda explain how to use bootstrap](https://github.com/plataformatec/simple_form)
* Add proper views and controller actions.
* Add authentication.
* Add authorization.
* [implement lock_version properly in forms](https://www.engineyard.com/blog/a-guide-to-optimistic-locking).

## Contribution Guidelines
* Please ensure that there are relevant tests in the Pull Request.
