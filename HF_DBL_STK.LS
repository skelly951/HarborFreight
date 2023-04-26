/PROG  HF_DBL_STK
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "RTE Double Stk ";
PROG_SIZE	= 633;
CREATE		= DATE 21-04-07  TIME 16:28:48;
MODIFIED	= DATE 21-04-22  TIME 15:01:46;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 22;
MEMORY_SIZE	= 1049;
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
   1:  !IF BLOCKED,PLACE FROM HIGHER UP ;
   2:  !UFRAME 2 ;
   3:  !Clear Boxes ;
   4:   ;
   5:  IF R[215:Box Height]>=R[279:Drop Rail Clear],JMP LBL[100] ;
   6:   ;
   7:  PR[230,3:INIT APP PL]=PR[258,3]+R[281:Prev Case Ht]+R[215:Box Height]+R[277:Place Buffer]+R[279:Drop Rail Clear]    ;
   8:  PR[233,3:FINAL APP PL]=PR[258,3]+R[281:Prev Case Ht]+R[215:Box Height]+R[277:Place Buffer]+R[279:Drop Rail Clear]    ;
   9:   ;
  10:  JMP LBL[200] ;
  11:  LBL[100] ;
  12:   ;
  13:  PR[230,3:INIT APP PL]=PR[258,3]+R[281:Prev Case Ht]+R[215:Box Height]+R[277:Place Buffer]+101.6    ;
  14:  PR[233,3:FINAL APP PL]=PR[258,3]+R[281:Prev Case Ht]+R[215:Box Height]+R[277:Place Buffer]+101.6    ;
  15:   ;
  16:  LBL[200] ;
  17:   ;
  18:  PR[234,3:PLACE]=PR[258,3]+R[281:Prev Case Ht]+R[215:Box Height]+R[277:Place Buffer]    ;
  19:  PR[236,3:INIT DEP PL]=PR[233,3:FINAL APP PL]    ;
  20:  PR[239,3:FINAL DEP PL]=PR[230,3:INIT APP PL]    ;
  21:   ;
  22:  R[291]=PR[233,3:FINAL APP PL]    ;
/POS
/END
