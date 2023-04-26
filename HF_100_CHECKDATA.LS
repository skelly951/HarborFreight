/PROG  HF_100_CHECKDATA
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Check Commnad";
PROG_SIZE	= 731;
CREATE		= DATE 20-07-11  TIME 11:30:32;
MODIFIED	= DATE 21-04-26  TIME 13:09:54;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 31;
MEMORY_SIZE	= 1119;
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
   1:  !Verify expected command ID ;
   2:  IF (R[202:CMD_ID]<>50),JMP LBL[9001] ;
   3:   ;
   4:  !Pick Loc Pallet Inbound  ;
   5:  IF (R[203:CMD_PRM_1_PICK]<>1100),JMP LBL[9002] ;
   6:   ;
   7:  !Place Loc Box Outbound ;
   8:  IF (R[204:CMD_PRM_2_DROP]<>1600),JMP LBL[9003] ;
   9:   ;
  10:  JMP LBL[9999] ;
  11:   ;
  12:  !INVALID DATA ERROR LOOP ;
  13:  LBL[9001] ;
  14:  !Invalid Command  ;
  15:  R[240:ERROR_STATE]=1    ;
  16:  JMP LBL[9000] ;
  17:   ;
  18:  LBL[9002] ;
  19:  !Invalid Command Param 1 ;
  20:  R[240:ERROR_STATE]=2    ;
  21:  JMP LBL[9000] ;
  22:   ;
  23:  LBL[9003] ;
  24:  !Invalid Command Param 2 ;
  25:  R[240:ERROR_STATE]=3    ;
  26:  JMP LBL[9000] ;
  27:   ;
  28:  LBL[9000:Error] ;
  29:  CALL HF_ERRORLOOP    ;
  30:   ;
  31:  LBL[9999:End] ;
/POS
/END
