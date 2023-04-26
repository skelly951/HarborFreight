/PROG  HF_VAC_OFF
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Vacuum Off";
PROG_SIZE	= 620;
CREATE		= DATE 20-06-29  TIME 11:06:20;
MODIFIED	= DATE 21-05-13  TIME 13:54:32;
FILE_NAME	= T_VACOFF;
VERSION		= 0;
LINE_COUNT	= 25;
MEMORY_SIZE	= 1064;
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
/MN
   1:  --eg:Vacuum Off
    :  --kn:KANJI Vacuum Off
    :  --ch:Vacuum Off ;
   2:  $WAITTMOUT=500 ;
   3:   ;
   4:  RO[1:VACUUM]=ON ;
   5:  WAIT    .50(sec) ;
   6:  WAIT RI[1:Vacuum Switch Sensor]=OFF TIMEOUT,LBL[9113] ;
   7:  WAIT RI[2:Cylinder EXT]=ON TIMEOUT,LBL[9112] ;
   8:  JMP LBL[9999] ;
   9:   ;
  10:   ;
  11:   ;
  12:  !Cylinder Retract Timeout ;
  13:  LBL[9112] ;
  14:  R[240:ERROR_STATE]=112    ;
  15:  JMP LBL[9000] ;
  16:   ;
  17:  !Vacuum Pressure High Timeout ;
  18:  LBL[9113] ;
  19:  R[240:ERROR_STATE]=113    ;
  20:  JMP LBL[9000] ;
  21:   ;
  22:  LBL[9000:Error] ;
  23:  CALL HF_ERRORLOOP    ;
  24:   ;
  25:  LBL[9999:END] ;
/POS
/END
