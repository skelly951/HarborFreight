/PROG  HF_RAIL_CLEAR
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 441;
CREATE		= DATE 21-04-29  TIME 06:57:28;
MODIFIED	= DATE 21-04-29  TIME 10:34:56;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 20;
MEMORY_SIZE	= 865;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/APPL

AUTO_SINGULARITY_HEADER;
  ENABLE_SINGULARITY_AVOIDANCE   : FALSE;
/MN
   1:  IF DI[83:Ok To Place]=OFF AND R[281:Prev Case Ht]=0,JMP LBL[5] ;
   2:   ;
   3:  JMP LBL[6] ;
   4:  LBL[5] ;
   5:   ;
   6:  R[281:Prev Case Ht]=R[215:Box Height]    ;
   7:   ;
   8:  LBL[6] ;
   9:   ;
  10:   ;
  11:  IF R[281:Prev Case Ht]>=R[279:Drop Rail Clear],JMP LBL[10] ;
  12:   ;
  13:  R[396:Z Offset Temp]=R[215:Box Height]+R[281:Prev Case Ht]+R[282:Clearance Buffer]+R[279:Drop Rail Clear]    ;
  14:   ;
  15:  JMP LBL[11] ;
  16:  LBL[10] ;
  17:   ;
  18:  R[396:Z Offset Temp]=R[215:Box Height]+R[281:Prev Case Ht]+R[282:Clearance Buffer]    ;
  19:   ;
  20:  LBL[11] ;
/POS
/END
