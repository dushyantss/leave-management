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
* Extract out the leave approver and requester heirarchy to allow multiple direct_approvers for one user.

## TODOs
* Restart from scratch for controllers, views, models and tests, i.e. everything business related. Just create models for now. Ensure that they capture all the required information. Add validations and other required things for them to work perfectly on their own. Then only will we start with controllers and other such things.
* Rename team_leader to direct_approver and team_members to direct_requesters. There could be indirect approvers and requesters when you go up and down the heirarchy.
* Use Rational class for LeaveEarning and LeaveConsumption calculation as the values would be in weird decimals otherwise.
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
