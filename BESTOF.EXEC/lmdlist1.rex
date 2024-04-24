/******************************* Rexx *********************************/
/* Exec to query list of data sets using the ISPF LMDLIST service with*/
/* the LIST option return a list of data sets and statistics for      */
/* processing.                                                        */
/**********************************************************************/
level    = "DAND.**.G%%%%V%%"        /* Dsname Level                  */
vol      = ""                        /* Volume                        */
stats    = "YES"                     /* Include stats (YES|NO|PRT)    */
dsvar    = ""                        /* First data set to return      */
status   = "NO"                      /* Show status bar (NO|YES)      */

/* LMDINIT to associate the level/volume with a dslist-id.            */
Address ISPEXEC "LMDINIT LISTID(LISTIDV) LEVEL("level") VOLUME("vol")"

Do Until rc <> 0
  Address ISPEXEC "LMDLIST LISTID("listidv") OPTION(LIST)",
                  "DATASET(DSVAR) STATS("stats") STATUS("status")"
  If rc = 0 Then
    Say Left(dsvar,44)  zdlsize "Track(s)" zdlext "Extent(s)"
End

/* FREE the data set list                                             */
Address ISPEXEC "LMDLIST LISTID("listidv") OPTION(FREE)"

/* LMDFREE to free up the dslist-id association                       */
Address ISPEXEC "LMDFREE LISTID("listidv")"

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
