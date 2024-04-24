/******************************* Rexx *********************************/
/* Exec to process directory list line commands for a call to the     */
/* ISPF DIRLIST service.                                              */
/**********************************************************************/
Address ISPEXEC "VGET (ZUDLCMD,ZUDPATH) SHARED"
zudmessg = ""
exitrc = 0
Select
  When zudlcmd = "B" Then
    Do
      /* Perform some pre-processing for the B built-in line command  */
      /* and set return code of 1 to have ISPF process normally.      */
      exitrc = 1
    End
  When zudlcmd = "LL" Then
    Do
      /* Perform the LL function and set ZUDMESSG variable.           */
      zudmessg = zudlcmd "Done"
    End
  Otherwise
    exitrc = 8
End
If zudmessg <> "" Then
  Address ISPEXEC "VPUT (ZUDMESSG) SHARED"
Exit exitrc
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
