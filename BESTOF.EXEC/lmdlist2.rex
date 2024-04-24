/******************************* Rexx *********************************/
/* Exec to query a data set name using a relative GDG number.         */
/**********************************************************************/
level    = "DAND.ERROR.REPORT(0)"    /* Dsname Level                  */
vol      = ""                        /* Volume                        */
stats    = "NO"                      /* Include stats (YES|NO|PRT)    */
dsvar    = ""                        /* First data set to return      */
status   = "NO"                      /* Show status bar (NO|YES)      */
/* LMDINIT to associate the level/volume with a dslist-id.            */
Address ISPEXEC "LMDINIT LISTID(LISTIDV) LEVEL("level") VOLUME("vol")"
Address ISPEXEC "LMDLIST LISTID("listidv") OPTION(LIST)",
                "DATASET(DSVAR) STATS("stats") STATUS("status")"
If rc = 0 Then
  Say Strip(dsvar,"T") "is the actual data set name for "level
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
