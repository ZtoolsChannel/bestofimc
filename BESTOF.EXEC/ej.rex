/******************************* Rexx *********************************/
/* Exec to edit a member of the JCL partitioned data set              */
/*   EJ            - displays member list for edits                   */
/*   EJ xxxxxxxx   - edits member or displays member list if pattern  */
/**********************************************************************/
Trace
Arg member
dsn = "DAND.JCL"
confirm = "NO"   /* YES to confirm cancel, move, and replace commands */

Address ISPEXEC

"CONTROL ERRORS RETURN"

If member <> "" Then
  "EDIT DATASET('"dsn"("member")') CONFIRM("confirm")"
Else
  "EDIT DATASET('"dsn"') CONFIRM("confirm")"

If rc > 4 Then
  "SETMSG MSG(ISRZ002)"

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
