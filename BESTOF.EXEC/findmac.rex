/**************************** Rexx ***********************************/
/* Edit Macro used by FIND exec.  Searches for findstr passed as a   */
/* parameter and returns findrc and findcnt.                         */
/*********************************************************************/
Address ISREDIT "MACRO (FINDSTR)"
Address ISREDIT "F "findstr
findrc = rc

If findrc <= 4 Then
  Do
    Address ISREDIT "(FINDCNT) = FIND_COUNTS"
    findcnt = findcnt + 0
  End
Else
  findcnt = 0
Address ISPEXEC "VPUT (FINDRC,FINDCNT) SHARED"

If findrc = 4 Then
  Address ISREDIT "CANCEL "
