/******************************* Rexx *********************************/
/* Exec to query members in a list using the ISPF LMMLIST service with*/
/* the LIST option to return a list of data sets and statistics for   */
/* processing.                                                        */
/**********************************************************************/
dsn1     = "'DAND.JCL'"              /* fully qualified data set name */
pattern  = "*A*"                     /* member pattern  Blank = All   */
stats    = "YES"                     /* Include stats (YES|NO)        */
memvar   = ""                        /* First member to return        */

/* LMINIT the data set.  LMINIT can also be used for an ISPF project  */
/* structure or a concatenated list of data sets allocated to a DD.   */
Address ISPEXEC "LMINIT DATAID(idvar) DATASET("dsn1") ENQ(SHRW)"

/* LMOPEN the data set                                                */
Address ISPEXEC "LMOPEN DATAID("idvar")"

/* Call LMMLIST service for the data id with variable values          */
Do Until rc <> 0
  Address ISPEXEC "LMMLIST DATAID("idvar") OPTION(LIST)",
                  "PATTERN("pattern") STATS("stats") MEMBER(MEMVAR)"
  If rc = 0 Then
    Say Left(memvar,8) "Last changed by "zluser" on "zlm4date
End

/* Free the member list                                               */
Address ISPEXEC "LMMLIST DATAID("idvar") OPTION(FREE)"

/* LMCLOSE the data set                                               */
Address ISPEXEC "LMCLOSE DATAID("idvar")"

/* LMFREE the data id associated with the data set.                   */
Address ISPEXEC "LMFREE DATAID("idvar")"

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
