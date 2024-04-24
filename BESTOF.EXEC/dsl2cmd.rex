/*REXX*****************************************************************/
/* ISPF/PDF edit macro to convert a saved data set list to a list of  */
/* commands substituting the first / for data set.                    */
/*                                                                    */
/* Examples using DAND.JCL as the data set name                       */
/*   DSL2CMD DELETE           ===> DELETE 'DAND.JCL'                  */
/*   DSL2CMD HMIGRATE / ML2   ===> HMIGRATE 'DAND.JCL' ML2            */
/*                                                                    */
/* Note: Data Set List SAVE XXX command creates userid.XXX.DATASETS   */
/**********************************************************************/
Address ISREDIT "MACRO (command)"
If command = "" Then
  Do
    zedsmsg = "Command required"
    zedlmsg = "A command template must be the first parameter"
    Address ISPEXEC "SETMSG MSG(ISRZ001)"
    Exit 12
  End
Address ISREDIT "(lines) = LINENUM .ZLAST"
Do linenum = 1 To lines
  Address ISREDIT "(line) = LINE "linenum
  Parse Var line dsn .
  dsn = "'"Strip(dsn,"B")"'"
  If Pos("/",command) = 0 Then
    newline = command dsn
  Else
    Do
      Parse Var command prefix "/" suffix
      newline = prefix || dsn || suffix
    End
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
