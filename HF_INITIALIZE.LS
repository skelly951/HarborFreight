/PROG  HF_INITIALIZE
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "RESET ROBOT";
PROG_SIZE	= 694;
CREATE		= DATE 20-06-29  TIME 11:05:34;
MODIFIED	= DATE 21-04-30  TIME 16:28:58;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 34;
MEMORY_SIZE	= 1198;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,1,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/MN
   1:  !Reset Error State ;
   2:  R[240:ERROR_STATE]=0    ;
   3:  GO[9]=R[240:ERROR_STATE] ;
   4:   ;
   5:  !Reset Transaction ID to PLC ;
   6:  R[201:TRANS_ID]=GI[2:TRANS ID]    ;
   7:   ;
   8:  R[226:ACK_TRANS_ID]=R[201:TRANS_ID]    ;
   9:  GO[2:Ack Trans ID]=R[226:ACK_TRANS_ID] ;
  10:   ;
  11:  !START TIMER ;
  12:  TIMER[1]=START ;
  13:   ;
  14:  !Reset CMD and CMD Parameters ;
  15:  R[202:CMD_ID]=0    ;
  16:  R[203:CMD_PRM_1_PICK]=0    ;
  17:  R[204:CMD_PRM_2_DROP]=0    ;
  18:  R[205:CMD_PRM_3_IFM]=0    ;
  19:  R[206:CMD_PRM_4_Mass]=0    ;
  20:  R[207:CMD_PRM_5_Ht]=0    ;
  21:   ;
  22:  R[227:ACK_CMD_ID]=R[202:CMD_ID]    ;
  23:  GO[3:Ack Cmd ID]=R[227:ACK_CMD_ID] ;
  24:   ;
  25:  !Reset Task Response ;
  26:  R[228:TASK_RSPND]=0    ;
  27:  GO[4:Task response]=R[228:TASK_RSPND] ;
  28:   ;
  29:  !Reset Project Specific Parametrs ;
  30:  CALL TIMERS_RESET    ;
  31:  COL DETECT ON ;
  32:   ;
  33:   ;
  34:  LBL[9999] ;
/POS
/END
