/******************************* Rexx *********************************/
/* Exec to edit a member of a concatenation of data sets (up to 16)   */
/*   ES            - displays member list for edits                   */
/*   ES xxxxxxxx   - edits member or displays member list if pattern  */
/**********************************************************************/
Arg mbr
ds1 = "'DAND.SPUFI'"
ds2 = "'ISPF.TEAM.SPUFI'"
ddname = "DD"Right(Time("L"),6)
confirm = "NO"

Address TSO "ALLOC FI("ddname") DA("ds1 ds2") SHR REUSE"
If rc > 0 Then Do; Say ddname "DD Allocation Failed"; Exit; End

Address ISPEXEC "CONTROL ERRORS RETURN"

Address ISPEXEC "LMINIT DATAID(EDITID) DDNAME("ddname") ENQ(SHRW)"
If rc > 4 Then Do; Address ISPEXEC "SETMSG MSG(ISRZ002)"; Exit; End

Address ISPEXEC "EDIT DATAID("editid") MEMBER("mbr") CONFIRM("confirm")"
If rc > 4 Then Do; Address ISPEXEC "SETMSG MSG(ISRZ002)"; Exit; End

Address ISPEXEC "LMFREE DATAID("editid")"
If rc > 4 Then Do; Address ISPEXEC "SETMSG MSG(ISRZ002)"; Exit; End

Address TSO "FREE FI("ddname")"
If rc > 0 Then Do; Say ddname "Free Failed"; Exit; End

Exit
/**********************************************************************/
/* Send questions, suggestions and/or bug reports to:                 */
/*                         Dan Dirkse                                 */
/*                   ztools.channel@gmail.com                         */
/**********************************************************************/
/*                                                                    */
/*             (C) Copyright The Z Tools Company, 2024                */
/*                                                                    */
/**********************************************************************/
/* This program is free software: you can redistribute it and/or      */
/* modify it under the terms of the GNU General Public License as     */
/* published by the Free Software Foundation, either version 3 of     */
/* the License, or (at your option) any later version.                */
/*                                                                    */
/* This program is distributed in the hope that it will be useful,    */
/* but WITHOUT ANY WARRANTY; without even the implied warranty of     */
/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the       */
/* GNU General Public License for more details.                       */
/*                                                                    */
/* You should have received a copy of the GNU General Public License  */
/* along with this program. If not, see https://www.gnu.org/licenses/ */
/**********************************************************************/
