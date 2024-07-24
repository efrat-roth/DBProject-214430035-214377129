
[General]
Version=1

[Preferences]
Username=
Password=2675
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=EFROTH
Name=DONOR_COURSES
Count=50

[Record]
Name=DONATION_ID
Type=NUMBER
Size=
Data=Sequence(1,1)
Master=

[Record]
Name=DONORID
Type=NUMBER
Size=
Data=List(select donorID from donor)
Master=

[Record]
Name=COURSEID
Type=NUMBER
Size=
Data=List(select c_ID from courses)
Master=

