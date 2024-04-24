/******************************* Rexx *********************************/
/* Exec to display a directory list using the ISPF DIRLIST service    */
/**********************************************************************/
/* dir variable contains the path to use for displaying the list      */
dir = "/SYSTEM/etc"
/* cols variable contains a list of column and length pairs for the   */
/* columns to be displayed by the list.  Use cols = "" for defaults.  */
cols = "PE,10,TY,4,MO,10"  /* permissions, type, modified date        */
/* lcmds variable contains the name of the line command processor and */
/* a list of built-in (B) and/or custom (LL) commands to be handled.  */
lcmds = "LCPROC,B,LL"
Address ISPEXEC "DIRLIST PATH(dir) COLS("cols") LCMDS("lcmds")"
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
