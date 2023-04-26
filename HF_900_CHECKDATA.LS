/PROG  HF_900_CHECKDATA
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Check Mant Commd";
PROG_SIZE	= 603;
CREATE		= DATE 20-07-11  TIME 11:30:48;
MODIFIED	= DATE 22-01-08  TIME 13:19:18;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 24;
MEMORY_SIZE	= 1019;
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
   1:  !Verify expected command ;
   2:  IF R[202:CMD_ID]<>900,JMP LBL[9001] ;
   3:   ;
   4:  !Pick Loc Pallet Inbound  ;
   5:  SELECT R[203:CMD_PRM_1_PICK]=1,JMP LBL[9999] ;
   6:         =2,JMP LBL[9001] ;
   7:         =3,JMP LBL[9999] ;
   8:         ELSE,JMP LBL[9002] ;
   9:   ;
  10:  !INVALID DATA ERROR LOOP ;
  11:  LBL[9001] ;
  12:  !Invalid Command  ;
  13:  R[240:ERROR_STATE]=1    ;
  14:  JMP LBL[9000] ;
  15:   ;
  16:  LBL[9002] ;
  17:  !Invalid Command Param 1 ;
  18:  R[240:ERROR_STATE]=2    ;
  19:  JMP LBL[9000] ;
  20:   ;
  21:  LBL[9000:Error] ;
  22:  CALL HF_ERRORLOOP    ;
  23:   ;
  24:  LBL[9999:End] ;
/POS
/END
