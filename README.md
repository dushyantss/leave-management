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
* Remove team_leader and team_members. We will create a separate table to handle leave approval heirarchy. This is required as we might have cases of multiple leave_approvers and maybe the manager/team_leader are not the only ones allowed to approve leave. But mostly we'll be doing this as we don't want to include heirarchy details in the employees table. Heirarchy is a separate thing from an employee and thus should stay separate. The employee table is the business contract between the org and the person. The user table is the connection of an employee with the system. We need a separate table to handle the relations between various users. **This will only be done when the requirement for a more complex heirarchy arises.** No need for a separate table till then.

## TODOs
* Restart from scratch for controllers, views, models and tests, i.e. everything business related. Just create models for now. Ensure that they capture all the required information. Add validations and other required things for them to work perfectly on their own. Then only will we start with controllers and other such things.
* Rename User model to Employee. Rename team_leader to manager and team_members to managees/team/staff. Then create a separate User model whose sole purpose is to use the system and thus store the credentials and other system related details, if any, and not any business details. We will also move the user type(normal, admin) to this model. We will alias employee attribute to employment_details.
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
