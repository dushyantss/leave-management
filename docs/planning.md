# Models

## User
* name
* designation
* email, unique
* mobile, unique
* dob
* employee_code, unique
* joining_date
* leaving_date, nullable
* avatar, nullable
* user_group: {normal(default), admin}

* belongs_to: team_leader, reference to User, nullable - in which case that user is the boss
* has_many: team_members, reference to User, dependent: nullify
* has_and_belongs_to_many NotificationGroup
* has_many Leave, dependent: destroy
* has_many Adjustments, dependent: :destroy

## NotificationGroup
* title, unique
* description, nullable
* image, nullable

* has_and_belongs_to_many User

## Leave
* reason
* status_reason, nullable, but is required when status changes to rescinded, rejected or reversed
* status: {pending, rescinded, rejected, approved, reversed}

* belongs_to: User
* has_many: LeaveDuration, dependent: :destroy
* has_many: LeaveEarningConsumption, dependent: :destroy

## LeaveDuration
* type: {optional, normal}
* start:date
* end:date

* belongs_to: Leave

## LeaveEarning
* value(default: 1.6667)
* expires_on, usually will be one year from creation

* has_many: LeaveEarningConsumption

## LeaveEarningConsumption
* value
* belongs_to: LeaveEarning
* belongs_to: Leave

## Adjustment
* reason
* value

* belongs_to: User

## OptionalHoliday
* title
* description, nullable
* date

# Business Logic
* in AUTH wherever team_leader is mentioned, it is assumed that the team_leader of the team_leader and others who are higher in this linkage(team_leader->team_leader->team_leader and so on) are all allowed the same privilege.

## User
* Basic model which inherently does not do much, almost all of the business logic is going to be present in the create and update of Leave.
* AUTH
    * CRUD - admin
    * RU - owner - can only update the avatar
    * R - team_leader

## NotificationGroup
* Holds information of all the users that need to be sent information if one of the members in the notification group is on holiday.
* For one Leave only one notification is to be sent even if we are using multiple notification groups and there might be some overlap.
* AUTH - CRUD - admin

## Leave
* The most complicated part business logic wise so we break it up as much as we can.
* CREATE
    * We will calculate optional holidays based on calendar year and normal holidays based on the last year or since the user's joining_date, whichever is earlier.
    * 5 optional holidays/year and 20 normal holidays per year. normal holidays are earned on a per month basis and thus users earn 1.67/month.
    * When we get an optional holiday duration, we just need to look at all the other optional holiday durations where leave status is pending or accepted for the user and ensure that the total count including the date range for this duration do not exceed 5. We also ensure that the date range actually includes only optional holidays(we check using the optional holidays model). I guess these validations will go into the LeaveDuration model.
    * When we get a normal holidays duration, we need to look at all the consumptions of unexpired leave earnings and ensure that we have enough days left to give to this holiday. This one will also go into the leave duration model.
* UPDATE
    * [We will ensure that we do not update a stale Leave.](https://api.rubyonrails.org/classes/ActiveRecord/Locking/Optimistic.html).
    * Will have the same checks for leaves as in CREATE.
    * only updates allowed for status are pending -> rescinded, rejected, approved; approved -> reversed. For any of these updates, status_reason field is required to be filled.
* DELETE - Only the admin can delete it and it must not cause much of an issue either way as will be auditing it.
* AUTH
    * CRUD - admin
    * CRU - owner - Cannot set status when creating. Can update only if status is pending, can update reason and leave durations completely, but can only update status from pending to rescinded.
    * RU - team_leader - but can only update one attribute, the status, and that too only from pending to rejected, pending to approved and approved to reversed

## LeaveDuration
* A dumb model just holding attributes.
* Leaves handles all the CRUD for this model. If accessed from other places, only read should be allowed and that too will mostly be based on the status of the Leave.
* AUTH
    * CRUD - admin, team_leader BUT ONLY THROUGH Leave
    * R - owner of Leave

## LeaveEarning
* This is a dumb model that will just hold all the normal leaves that the system will generate for the user on a monthly basis.
* AUTH - CR - admin

## LeaveEarningConsumption
* This will hold all the consumption entries for leave earnings and in which leave were they consumed.
* AUTH - R - admin, team_leader, owner of leave

## Adjustment
* Will be permanent additions to user's leaves, no time limit.
* Most important use case is emergency leaves which go above the allowed limit. These might need to be adjusted if there are too many and the user needs more leaves.
* AUTH - CRUD - admin

## OptionalHoliday
* Basic table to hold required data for optional holidays.
* AUTH
    * CRUD - admin
    * R - user



# TODOs
* Add business logic for Leave, LeaveEarning, LeaveEarningConsumption and related Adjustment and OptionalHoliday. Also, the usage of Users and NotificationGroups.
* Add kaminari and ransack.
* Add proper views and controller actions.
* Add authentication.
* Add authorization.
* [implement lock_version properly in forms.](https://www.engineyard.com/blog/a-guide-to-optimistic-locking)
