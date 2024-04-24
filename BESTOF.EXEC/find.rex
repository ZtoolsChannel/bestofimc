/**************************** Rexx ***********************************/
/* Run the FINDMAC macro against sequential data set in option 3.4.  */
/* Sets ZDLMSG as the message for 3.4 to display.                    */
/*********************************************************************/
Arg data

dsnstart = Lastpos("'",Left(data,length(data)-1))
Parse Var data findstr =(dsnstart) dsn

Address ISPEXEC "VIEW DATASET("dsn") MACRO(FINDMAC) PARM(FINDSTR)"
Address ISPEXEC "VGET (FINDRC,FINDCNT) SHARED"
Select
  When findrc = 0 Then
    If findcnt > 1 Then
      zdlmsg = findcnt "found"
    Else
      zdlmsg = "String found"
  When findrc = 4 Then
    zdlmsg = "String not found"
  Otherwise
    zdlmsg = "Error occurred"
End

Address ISPEXEC "VPUT (ZDLMSG) SHARED"
Exit findrc
