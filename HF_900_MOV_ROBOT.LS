/PROG  HF_900_MOV_ROBOT
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "MAINT/GRIPPER";
PROG_SIZE	= 1108;
CREATE		= DATE 22-01-10  TIME 12:05:54;
MODIFIED	= DATE 22-01-10  TIME 12:05:54;
FILE_NAME	= IC_900_M;
VERSION		= 0;
LINE_COUNT	= 47;
MEMORY_SIZE	= 1584;
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
   1:  OVERRIDE=R[255:SPEED_OVERRIDE] ;
   2:   ;
   3:  R[257:VEL SETTING]=R[256:RECOVER_OVERRIDE]/100*2500    ;
   4:  R[258:ACC SETTING]=R[256:RECOVER_OVERRIDE]/100    ;
   5:   ;
   6:   ;
   7:  !Setup Payload & Frames ;
   8:  PAYLOAD[1:Vacuum Gripper] ;
   9:  UFRAME_NUM=0 ;
  10:  UTOOL_NUM=1 ;
  11:   ;
  12:   ;
  13:   ;
  14:  !***************************** ;
  15:  !Maint. & SafePos ;
  16:  !***************************** ;
  17:   ;
  18:  !Check Command Valid ;
  19:  CALL HF_900_CHECKDATA    ;
  20:   ;
  21:  !If Already at Maint/Removal ;
  22:  !Then Skip ;
  23:  IF R[202:CMD_ID]=900 AND R[203:CMD_PRM_1_PICK]=1 AND R[250:CUR_POS]=910,JMP LBL[9999] ;
  24:   ;
  25:  !Move To Safe Pos ;
  26:  IF R[202:CMD_ID]=900 AND R[203:CMD_PRM_1_PICK]=3,CALL HF_SAFEPOS ;
  27:  //JMP LBL[8999] ;
  28:   ;
  29:  !IF ANYWHERE ELSE MOVE HOME ;
  30:  IF R[250:CUR_POS]<>1000 OR R[250:CUR_POS]<>910,CALL HF_RECOV ;
  31:   ;
  32:  !Call Gripper Maintenance ;
  33:  IF R[203:CMD_PRM_1_PICK]<>1,JMP LBL[9999] ;
  34:   ;
  35:  !Gripper Maintenance ;
  36:  LBL[1:Maintenance] ;
  37:L PR[202:MAINT] R[257:VEL SETTING]mm/sec FINE ACC R[258]    ;
  38:  R[250:CUR_POS]=910    ;
  39:  R[241:LOC_STATUS]=910    ;
  40:  GO[10]=R[241:LOC_STATUS] ;
  41:  JMP LBL[9999] ;
  42:   ;
  43:  LBL[8999] ;
  44:   ;
  45:  CALL ABORTIT    ;
  46:   ;
  47:  LBL[9999] ;
/POS
/END
