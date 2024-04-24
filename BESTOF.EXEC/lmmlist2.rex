/******************************* Rexx *********************************/
/* Exec to query list of members using the ISPF LMMLIST service with  */
/* the SAVE option to write information to userid.group.MEMBERS or    */
/* to the ISPF LIST data set if no group is specified.                */
/**********************************************************************/
dsn1     = "'DAND.SYS1.PARMLIB'"     /* fully qualified data set name */
pattern  = "*"                       /* member pattern  Blank = All   */
group    = "PARMLIB"                 /* Second qualifier for SAVE ds  */
saveds   = group".MEMBERS"           /* SAVE output data set          */
stats    = "YES"                     /* Include stats (YES|NO)        */
long     = "LONG"                    /* Statistics in long format     */

/* LMINIT the data set.  LMINIT can also be used for an ISPF project  */
/* structure or a concatenated list of data sets allocated to a DD.   */
Address ISPEXEC "LMINIT DATAID(idvar) DATASET("dsn1") ENQ(SHRW)"

/* LMOPEN the data set                                                */
Address ISPEXEC "LMOPEN DATAID("idvar")"

/* Call LMMLIST service for the data id with variable values.         */
Address ISPEXEC "LMMLIST DATAID("idvar") OPTION(SAVE) GROUP("group")" ,
                "PATTERN("pattern") STATS("stats")" long

/* FREE the member list                                               */
Address ISPEXEC "LMMLIST DATAID("idvar") OPTION(FREE)"

/* LMCLOSE the data set                                               */
Address ISPEXEC "LMCLOSE DATAID("idvar")"

/* LMFREE the data id associated with the data set.                   */
Address ISPEXEC "LMFREE DATAID("idvar")"

/* EDIT the data set information if not written to LIST data set      */
If group <> "" Then
  Address ISPEXEC "EDIT DATASET("saveds")"
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
