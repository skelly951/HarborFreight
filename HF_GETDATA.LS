/PROG  HF_GETDATA
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "GET PLC PARAM";
PROG_SIZE	= 736;
CREATE		= DATE 20-06-29  TIME 11:05:24;
MODIFIED	= DATE 21-04-29  TIME 10:13:26;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 36;
MEMORY_SIZE	= 1224;
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
   1:  !Read in Data ;
   2:  !Set Transaction = PLC ;
   3:  R[201:TRANS_ID]=GI[2:TRANS ID]    ;
   4:   ;
   5:  !Get Command ;
   6:  R[202:CMD_ID]=GI[3:CMD ID]    ;
   7:  !Get Command Parameters ;
   8:  R[203:CMD_PRM_1_PICK]=GI[4:CMD PARAM 1]    ;
   9:  R[204:CMD_PRM_2_DROP]=GI[5:CMD PARAM 2]    ;
  10:  R[205:CMD_PRM_3_IFM]=GI[6:CMD PARAM 3]    ;
  11:   ;
  12:  R[206:CMD_PRM_4_Mass]=GI[7:CMD PARAM 4]/10    ;
  13:  R[207:CMD_PRM_5_Ht]=GI[8:CMD PARAM 5]/10    ;
  14:  R[208:CMD_PRM_6_LG]=GI[13:CMD PARAM 6]/10    ;
  15:  R[209:CMD_PRM_7_WD]=GI[14:CMD PARAM 7]/10    ;
  16:   ;
  17:  R[215:Box Height]=R[207:CMD_PRM_5_Ht]    ;
  18:   ;
  19:   ;
  20:  !Simulation Only ;
  21:  //R[220]=R[201:TRANS_ID]*R[215:Box Height]    ;
  22:  //R[205:CMD_PRM_3_IFM]=R[205:CMD_PRM_3_IFM]-R[220]    ;
  23:   ;
  24:  !Ack Tx and Cmd IDs ;
  25:  LBL[20:Ack Data] ;
  26:  R[226:ACK_TRANS_ID]=R[201:TRANS_ID]    ;
  27:   ;
  28:  GO[2:Ack Trans ID]=R[226:ACK_TRANS_ID] ;
  29:   ;
  30:  R[227:ACK_CMD_ID]=R[202:CMD_ID]    ;
  31:  GO[3:Ack Cmd ID]=R[227:ACK_CMD_ID] ;
  32:   ;
  33:  !New Task, Task Rsp = 0 ;
  34:  R[228:TASK_RSPND]=0    ;
  35:   ;
  36:  GO[4:Task response]=R[228:TASK_RSPND] ;
/POS
/END
