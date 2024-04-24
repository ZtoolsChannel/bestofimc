The components in this package are related to the session
"Best of" the ISPF Master Classes given by me at GSE-UK
and SHARE conferences.

Please provide me with any suggestions and/or corrections.

Dan Dirkse
ztools.channel@gmail.com                                                      */


The following files make up the package and should be maintained with
the GNU GENERAL PUBLIC LICENSE contained in the @LICENSE.TXT file.

@LICENSE.TXT - GNU GENERAL PUBLIC LICENSE
@README.TXT  - This file
BATEDIT.REX  - Exec to call the editor in batch
BATJCL.JCL   - JCL to call BATEDIT
CHANGEIT.REX - Example initial edit macro used by BATEDIT
COMPDSN.REX  - Edit macro to compare data sets (called by COMPJCL)
COMPJCL.REX  - Edit macro to compare JCL member to the 'system' library
DIRLIST.REX  - Exec to display a directory list
DSL2CMD.REX  - Edit macro to convert DSLIST SAVE output to a command
EE.REX       - Exec to edit an ISPF Library
EJ.REX       - Exec to edit a data set
ES.REX       - Exec to edit a concatenation of (up to 16) data sets
FIND.REX     - Exec to perform a find against sequential data set from 3.4
FINDMAC.REX  - Edit macro to perform the find by the FIND.REX exec from 3.4
INLINE.REX   - Edit macro to copy text from DSN on cursor line as a SYSIN DD *
ISPFBAT.JCL  - JCL Procedure example to run ISPF in batch (used by BATJCL)
LCPROC.REX   - Exec used to process line commands for a directory list
LMCENTER.REX - Line command edit macro to center data line(s)
LMDDISP.REX  - Exec to display a data set list
LMDLIST1.REX - Exec to query a data set list
LMDLIST2.REX - Exec to query a single GDG generation
LMDLIST3.REX - Exec to query a data set list and do a SAVE
LMDO.REX     - Line command edit macro to wrap Do-End around data line(s)
LMMLIST1.REX - Exec to query a member list
LMMLIST2.REX - Exec to query a member list and do a SAVE
LMSPY.REX    - Line command edit macro to add an ISREMSPY line after data line
MARKDIFF.REX - Edit macro to show differences between to lines in the data
MEMLIST.REX  - Exec to display an enhanced member list w/3.1 functions
MEM2SEL.REX  - Edit macro to convert member list SAVE output to IEBCOPY
NXCOPY.REX   - Edit macro to copy source data after/before each NX data line
RESC.REX     - Edit macro to reset after a COMPARE command
S.REX        - Exec to handle the S line command on enhanced member lists
SETSTART.REX - Exec to set the ZSTART Profile variable to start multiple screens
STEPS.REX    - Edit macro to show only JCL EXEC statements

Note: Due to character set changes while downloading/uploading the LMDO macro
      you may need to manually update the SEEK statement's picture string.
      The character between the single quotes needs to be a not sign (hex 5F).
