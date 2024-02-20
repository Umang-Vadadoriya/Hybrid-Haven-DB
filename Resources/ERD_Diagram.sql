Table "Employee" {
  "EmployeeId" integer [pk]
  "EmployeeName" varchar2(50) [not null]
  "EmployeeEmail" varchar2(50) [not null]
  "EmployeeContact" varchar2(12) [not null]
  "EmpReportsTo" integer [not null]
}

Table "DeskBooking" {
  "DeskBookingId" integer [pk]
  "EmployeeId" integer [not null]
  "NeighbourId" integer [not null]
  "DeskBookingDate" date [not null]
}

Table "Vacation" {
  "VacationId" integer [pk]
  "EmployeeId" integer [not null]
  "VacationStartDate" date [not null]
  "VacationEndDate" date [not null]
}

Table "Events" {
  "EventID" integer [pk]
  "EventName" varchar2(50) [not null]
  "EventDescription" varchar2(300)
  "EventDate" datetime [not null]
}

Table "NeighbourHood" {
  "NeighbourId" integer [pk]
  "NeighbourName" varchar2(30) [not null]
  "NeighbourNumberOfDesk" integer [not null]
}

Table "EventsEmployees" {
  "EventId" integer [not null]
  "EmployeeId" integer [not null]
}

Ref:"Employee"."EmployeeId" < "DeskBooking"."EmployeeId"

Ref:"Employee"."EmployeeId" < "Vacation"."EmployeeId"

Ref:"Employee"."EmployeeId" < "EventsEmployees"."EmployeeId"

Ref:"Events"."EventID" < "EventsEmployees"."EventId"

Ref:"NeighbourHood"."NeighbourId" < "DeskBooking"."NeighbourId"