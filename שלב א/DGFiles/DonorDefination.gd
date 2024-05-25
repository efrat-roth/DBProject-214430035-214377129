
[General]
Version=1

[Preferences]
Username=
Password=2151
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=EFROTH
Name=DONOR
Count=10..20

[Record]
Name=DONORID
Type=NUMBER
Size=10
Data=Sequence(3, [Inc], [WithinParent])
Master=

[Record]
Name=NAME
Type=VARCHAR2
Size=100
Data=FirstName + LastName
Master=

[Record]
Name=ISACTIVE
Type=CHAR
Size=1
Data=List('y', 'n')
Master=

[Record]
Name=DESIGNATION
Type=VARCHAR2
Size=100
Data=List('For the memory of the family -')  + LastName
Master=

