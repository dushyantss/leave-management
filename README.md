# Leave Management

Office needs a leave management software. Took too long to decide which ready made solution to use. Need to practice rails. So, here it is. Basic leave management.

## Setup
* bundle install

## Test
* bundle exec rails test

## Planned Improvements
* Automatic optimized leave request creation based on given date range.
* Different optional holidays for different offices.
* Add internationalization.
* Comments on Leaves.
* Half day leaves.
* Extract out the leave approver and requester heirarchy to allow multiple approvers for one user.

## TODOs
* Add unit tests for validations. This will ensure that we do not remove them in the future unknowingly.
* Add business logic for Leave, LeaveEarning, LeaveConsumption and related OptionalHoliday.
* Add audited gem to all relevant models.
* Add kaminari and ransack.
* [Add simple forms. The docs also kinda explain how to use bootstrap](https://github.com/plataformatec/simple_form)
* Add proper views and controller actions.
* Add authentication.
* Add authorization.
* [implement lock_version properly in forms](https://www.engineyard.com/blog/a-guide-to-optimistic-locking).

## Contribution Guidelines
* Please ensure that there are relevant tests in the Pull Request.
