
[General]
Version=1

[Preferences]
Username=
Password=2631
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=EFROTH
Name=OPERATORCOURSE
Count=300

[Record]
Name=OPERATORID
Type=NUMBER
Size=
Data=List(select operatorID from operator)
Master=

[Record]
Name=G_ID
Type=NUMBER
Size=
Data=List(select g_ID from studentsGroup)
Master=

