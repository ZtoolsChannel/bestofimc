/*REXX*****************************************************************/
/*   ISPF/PDF edit macro to convert a saved member list to            */
/*   IEBCOPY SELECT statements.                                       */
/*   Note: Member List SAVE XXX command creates userid.XXX.MEMBERS    */
/**********************************************************************/
Address ISREDIT "MACRO"

Address ISREDIT "(LINES)  = LINENUM .ZLAST"

Do linenum = 1 To lines
  Address ISREDIT "(line) = LINE "linenum
  Parse Var line member .
  member = Strip(member,"B")
  newline = "  SELECT MEMBER=(("member",,R))"
  Address ISREDIT "LINE" linenum" = (newline)"
End

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
