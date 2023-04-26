/PROG  HF_ERRORLOOP
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "LOGIC ERROR";
PROG_SIZE	= 1128;
CREATE		= DATE 20-06-29  TIME 11:05:10;
MODIFIED	= DATE 21-04-08  TIME 10:59:48;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 58;
MEMORY_SIZE	= 1536;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/MN
   1:  !No Error Exit Errorloop ;
   2:  IF R[240:ERROR_STATE]=0,JMP LBL[9999] ;
   3:   ;
   4:  !Jump to Error # ;
   5:  GO[9]=R[240:ERROR_STATE] ;
   6:  JMP LBL[R[240]] ;
   7:   ;
   8:  !Invalid Command ID ;
   9:  LBL[1] ;
  10:  JMP LBL[800] ;
  11:   ;
  12:  !Invalid Command Parameter 1 ;
  13:  LBL[2] ;
  14:  JMP LBL[800] ;
  15:   ;
  16:  !Invalid Command Parameter 2 ;
  17:  LBL[3] ;
  18:  JMP LBL[800] ;
  19:   ;
  20:  !IFM Height Under Threshold ;
  21:  LBL[103] ;
  22:  JMP LBL[800] ;
  23:   ;
  24:  !IFM Height Over Threshold ;
  25:  LBL[104] ;
  26:  JMP LBL[800] ;
  27:   ;
  28:  !Box Height Under Threshold ;
  29:  LBL[105] ;
  30:  JMP LBL[800] ;
  31:   ;
  32:  !Box Height Over Threshold ;
  33:  LBL[106] ;
  34:  JMP LBL[800] ;
  35:   ;
  36:  !Cylinder Extension Timeout ;
  37:  LBL[111] ;
  38:  JMP LBL[800] ;
  39:   ;
  40:  !Cylinder Retract Timeout ;
  41:  LBL[112] ;
  42:  JMP LBL[800] ;
  43:   ;
  44:  !Vacuum Pressure High Timeout ;
  45:  LBL[113] ;
  46:  JMP LBL[800] ;
  47:   ;
  48:  !Vacuum Pressure Low Timeout ;
  49:  LBL[114] ;
  50:  JMP LBL[800] ;
  51:   ;
  52:  LBL[800] ;
  53:  !ABORTED STATE ;
  54:  R[242:ROBOT_STATE]=505    ;
  55:  GO[11]=R[242:ROBOT_STATE] ;
  56:  CALL ABORTIT    ;
  57:   ;
  58:  LBL[9999:End] ;
/POS
/END
