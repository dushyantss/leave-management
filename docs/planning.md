# Key User expectations

* Timezone handling. We will just keep everything in the UTC timezone and if/when we want the user to have different leaves for different time zones/office locations we'll add time zones to leaves and users and manage is that way.
* Leave Creation
    * When creating a leave, user expects to see available leave inventory.
    * Users need to be allowed to create back dated leaves.
    * Leaves which remain pending, still consume inventory.
    * There are two types of leaves normal and optional.
    * There needs to be a provision to provide extra leaves for emergency events.
    * Users might sometimes get special permissions where they use up future leaves. In that case, they should be allowed to create a leave which does not have inventory now but will consume inventory from the future. This might be the case for trying to align dates in holidays or in some emergency.
    * If we make a matrix of the leaves' usages it comes out as follows
        * Normal leaves usages - People use up leaves that they earned over time period. We take into consideration all the unexpired leaves and consume part of them for the leave.
        * Emergency leaves - The user does not have sufficient holidays but they just have to take them. So, the system should keep track of the extra days that are being taken as leaves and keep track of them somewhere. Then, we can use up any new leave earnings to settle up this tab. We also need to allow system admins to create leave earnings with a note where people can take unpaid leaves.
        * Back dated leaves - This will happen when the user either forgot to add leave, intentionally did not add leave and the mistake is being corrected now or they are creating same day leave due to being sick. In this case as well we need to allow this to happen.
    * We will keep track of leaves consumed being more than leaves earned using the leaves model. We will sum the total leave duration and diff it with the leave consumption and if the result is non zero, that means that the person has taken more holidays than available.

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

* belongs_to: direct_approver, reference to User, nullable - in which case that user is the boss
* has_many: direct_requesters, reference to User, dependent: nullify
* has_and_belongs_to_many NotificationGroup
* has_many Leave, dependent: destroy
* has_many LeaveEarning, dependent: :destroy

## NotificationGroup
* title, unique
* description, nullable
* image, nullable

* has_and_belongs_to_many User

## Leave
* reason
* status_reason, nullable, but is required when status changes to rescinded, rejected or reversed
* status: {pending, rescinded, rejected, approved, reversed}

* belongs_to: User also alias as requester
* has_many: LeaveDuration, dependent: :destroy
* has_many: LeaveConsumption, dependent: :destroy

## LeaveDuration
* type: {optional, normal}
* start:datetime
* end:datetime

* belongs_to: Leave

## LeaveEarning
* value_numerator: integer
* value_denominator: integer
* type: {optional, normal}
* reason: This will hold the reason for the earning
* expires_on, usually will be one year from creation

* belongs_to: User
* has_many: LeaveConsumption

## LeaveConsumption
* value_numerator: integer
* value_denominator: integer
* belongs_to: LeaveEarning
* belongs_to: Leave

## OptionalHoliday
* title
* description, nullable
* date

# Business Logic
* in AUTH wherever direct_approver is mentioned, it is assumed that the direct_approver of the direct_approver and others who are higher in this linkage(direct_approver->direct_approver->direct_approver and so on) are all allowed the same privilege.

## User
* Basic model which inherently does not do much, almost all of the business logic is going to be present in the create and update of Leave.
* AUTH
    * CRUD - admin
    * RU - requester - can only update the avatar
    * R - direct_approver

## NotificationGroup
* Holds information of all the users that need to be sent information if one of the members in the notification group is on holiday.
* For one Leave only one notification is to be sent even if we are using multiple notification groups and there might be some overlap.
* AUTH - CRUD - admin

## Leave
* The most complicated part business logic wise so we break it up as much as we can.
* CREATE
    * We will calculate holidays based on the last year or since the user's joining_date, whichever is earlier.
    * 5 optional holidays/year and 20 normal holidays per year. holidays are earned on a per month basis and thus users earn 20/12 per month normal holidays and 5/12 per month optional holidays.
    * When we get a holidays duration, we need to look at all the consumptions of unexpired leave earnings and ensure that we have enough days left to give to this holiday. This one will also go into the leave duration model.
* UPDATE
    * [We will ensure that we do not update a stale Leave.](https://api.rubyonrails.org/classes/ActiveRecord/Locking/Optimistic.html).
    * Will have the same checks for leaves as in CREATE.
    * only updates allowed for status are pending -> rescinded, rejected, approved; approved -> reversed. For any of these updates, status_reason field is required to be filled.
* DELETE - Only the admin can delete it and it must not cause much of an issue either way as will be auditing it.
* AUTH
    * CRUD - admin
    * CRU - requester - Cannot set status when creating. Can update only if status is pending, can update reason and leave durations completely, but can only update status from pending to rescinded.
    * RU - direct_approver - but can only update one attribute, the status, and that too only from pending to rejected, pending to approved and approved to reversed

## LeaveDuration
* A dumb model just holding attributes.
* Leaves handles all the CRUD for this model. If accessed from other places, only read should be allowed and that too will mostly be based on the status of the Leave.
* AUTH
    * CRUD - admin, direct_approver BUT ONLY THROUGH Leave
    * R - requester of Leave BUT ONLY THROUGH Leave

## LeaveEarning
* All the system generated and admin created leaves for a user are stored here.
* AUTH
    * CRUD - admin
    * R - requester of leave, direct_approver

## LeaveConsumption
* This will hold all the consumption entries for leave earnings and in which leave were they consumed.
* This will be required in the calculation of the available leaves.
* AUTH - R - admin, direct_approver, requester of leave

## OptionalHoliday
* Basic table to hold required data for optional holidays.
* AUTH
    * CRUD - admin
    * R - user
