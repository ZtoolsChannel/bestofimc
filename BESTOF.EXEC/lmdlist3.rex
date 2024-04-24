/******************************* Rexx *********************************/
/* Exec to query list of data sets using the ISPF LMDLIST service with*/
/* the SAVE option to write information to userid.group.DATASETS or   */
/* to the ISPF LIST data set if no group is specified.                */
/**********************************************************************/
level    = "DAND.ERROR.REPORT.G*"    /* Dsname Level                  */
vol      = ""                        /* Volume                        */
group    = "LMD"                     /* Second qualifier for SAVE ds  */
saveds   = group".DATASETS"          /* SAVE output data set          */
stats    = "YES"                     /* Include stats (YES|NO|PRT)    */
savetype = "SAVE"                    /* Save type (SAVE|SAVEC)        */
status   = "YES"                     /* Show status bar (NO|YES)      */
/* LMDINIT to associate the level/volume with a dslist-id.            */
Address ISPEXEC "LMDINIT LISTID(LISTIDV) LEVEL("level") VOLUME("vol")"
Address ISPEXEC "LMDLIST LISTID("listidv") OPTION("savetype")",
                "STATS("stats") GROUP("group") STATUS("status")"
/* LMDFREE to free up the dslist-id association                       */
Address ISPEXEC "LMDFREE LISTID("listidv")"
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
