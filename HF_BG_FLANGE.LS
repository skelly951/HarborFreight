/PROG  HF_BG_FLANGE
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 377;
CREATE		= DATE 21-04-27  TIME 11:34:36;
MODIFIED	= DATE 21-04-29  TIME 06:08:08;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 13;
MEMORY_SIZE	= 837;
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
   1:  !Constantly Check Flange Sensors ;
   2:  IF RI[4:Flange Prox 1]=ON OR RI[5:Flange Prox 2]=ON,JMP LBL[4] ;
   3:   ;
   4:  JMP LBL[9999] ;
   5:   ;
   6:  LBL[4] ;
   7:  R[240:ERROR_STATE]=115    ;
   8:  GO[9]=R[240:ERROR_STATE] ;
   9:   ;
  10:  !Call Abort it ;
  11:  CALL ABORTIT    ;
  12:   ;
  13:  LBL[9999] ;
/POS
/END
