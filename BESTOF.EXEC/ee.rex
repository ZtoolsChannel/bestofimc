/******************************* Rexx *********************************/
/* Exec to edit a member of an ISPF library.                          */
/*   EE            - displays member list for edits                   */
/*   EE xxxxxxxx   - edits member or displays member list if pattern  */
/**********************************************************************/
Trace
Arg member
proj = "DAND"
grps = "DEV TEST STAGING PROD"
Parse Var grps grp1 grp2 grp3 grp4
type = "EXEC"
confirm = "NO"

Address ISPEXEC

"CONTROL ERRORS RETURN"

"LMINIT DATAID(EDITID) PROJECT("proj") GROUP1("grp1") GROUP2("grp2")" ,
        "GROUP3("grp3") GROUP4("grp4") TYPE("type") ENQ(SHRW)"
If rc > 4 Then Do; "SETMSG MSG(ISRZ002)"; Exit; End

"EDIT DATAID("editid") MEMBER("member") CONFIRM("confirm")"
If rc > 4 Then Do; "SETMSG MSG(ISRZ002)"; Exit; End

"LMFREE DATAID("editid")"
If rc > 4 Then Do; "SETMSG MSG(ISRZ002)"; Exit; End

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
