/PROG  HF_SAFEPOS
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2185;
CREATE		= DATE 21-04-28  TIME 09:07:34;
MODIFIED	= DATE 22-01-08  TIME 15:12:18;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 127;
MEMORY_SIZE	= 2713;
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
   1:  OVERRIDE=R[255:SPEED_OVERRIDE] ;
   2:   ;
   3:  R[257:VEL SETTING]=R[256:RECOVER_OVERRIDE]/100*2500    ;
   4:  R[258:ACC SETTING]=R[256:RECOVER_OVERRIDE]/100    ;
   5:   ;
   6:  !Setup Payload & Frames ;
   7:  PAYLOAD[1:Vacuum Gripper] ;
   8:  UFRAME_NUM=0 ;
   9:  UTOOL_NUM=1 ;
  10:   ;
  11:   ;
  12:   ;
  13:  !***************************** ;
  14:  !Move to Position State ;
  15:  !***************************** ;
  16:  JMP LBL[R[250]] ;
  17:   ;
  18:  !***************************** ;
  19:  !Move Home from Pick ;
  20:  !***************************** ;
  21:   ;
  22:  LBL[120] ;
  23:  UFRAME_NUM=1 ;
  24:L PR[234:PLACE] R[257:VEL SETTING]mm/sec FINE ACC R[258]    ;
  25:  R[250:CUR_POS]=120    ;
  26:   ;
  27:  !Change Payload to Empty ;
  28:  CALL HF_VAC_OFF    ;
  29:  PAYLOAD[1:Vacuum Gripper] ;
  30:  R[252:CUR_LOAD]=0    ;
  31:   ;
  32:  LBL[110] ;
  33:  R[252:CUR_LOAD]=0    ;
  34:L PR[223:FINAL APP PK] R[257:VEL SETTING]mm/sec FINE ACC R[258]    ;
  35:  R[250:CUR_POS]=110    ;
  36:   ;
  37:  LBL[105] ;
  38:  UFRAME_NUM=1 ;
  39:L PR[220:INIT APP PK] R[257:VEL SETTING]mm/sec FINE ACC R[258]    ;
  40:  R[250:CUR_POS]=105    ;
  41:   ;
  42:  JMP LBL[1000] ;
  43:   ;
  44:   ;
  45:   ;
  46:  !***************************** ;
  47:  !Move Home From Place ;
  48:  !***************************** ;
  49:   ;
  50:  LBL[220] ;
  51:  UFRAME_NUM=2 ;
  52:L PR[234:PLACE] R[257:VEL SETTING]mm/sec FINE ACC R[258]    ;
  53:  R[250:CUR_POS]=220    ;
  54:   ;
  55:  !Change Payload to Empty ;
  56:  PAYLOAD[1:Vacuum Gripper] ;
  57:  R[252:CUR_LOAD]=0    ;
  58:   ;
  59:  !Update Prev Ht ;
  60:  R[281:Prev Case Ht]=R[215:Box Height]    ;
  61:   ;
  62:  LBL[230] ;
  63:  UFRAME_NUM=2 ;
  64:L PR[236:INIT DEP PL] R[257:VEL SETTING]mm/sec FINE ACC R[258]    ;
  65:  R[250:CUR_POS]=230    ;
  66:   ;
  67:  LBL[240] ;
  68:  UFRAME_NUM=2 ;
  69:L PR[239:FINAL DEP PL] R[257:VEL SETTING]mm/sec FINE ACC R[258]    ;
  70:  R[250:CUR_POS]=240    ;
  71:   ;
  72:  !EXIT CONVEYOR 200 ;
  73:  R[241:LOC_STATUS]=209    ;
  74:  GO[10]=R[241:LOC_STATUS] ;
  75:   ;
  76:  JMP LBL[1000] ;
  77:   ;
  78:   ;
  79:   ;
  80:  !***************************** ;
  81:  !Move Home From Maint ;
  82:  !***************************** ;
  83:   ;
  84:  LBL[910] ;
  85:  UFRAME_NUM=0 ;
  86:L PR[202:MAINT] R[257:VEL SETTING]mm/sec FINE ACC R[258]    ;
  87:  R[250:CUR_POS]=910    ;
  88:  JMP LBL[1000] ;
  89:   ;
  90:   ;
  91:   ;
  92:  !***************************** ;
  93:  !Move Home ;
  94:  !***************************** ;
  95:   ;
  96:  LBL[100] ;
  97:  LBL[1000] ;
  98:   ;
  99:  UFRAME_NUM=0 ;
 100:L PR[200:HOME] R[257:VEL SETTING]mm/sec FINE ACC R[258]    ;
 101:  R[250:CUR_POS]=1000    ;
 102:   ;
 103:  CALL HF_VAC_OFF    ;
 104:   ;
 105:  R[241:LOC_STATUS]=9999    ;
 106:  GO[10]=R[241:LOC_STATUS] ;
 107:   ;
 108:  R[252:CUR_LOAD]=0    ;
 109:   ;
 110:   ;
 111:  LBL[125] ;
 112:  LBL[130] ;
 113:  LBL[205] ;
 114:  LBL[210] ;
 115:  LBL[254] ;
 116:  LBL[264] ;
 117:   ;
 118:   ;
 119:  JMP LBL[9999] ;
 120:   ;
 121:   ;
 122:   ;
 123:  !ERROR LOOP ;
 124:  LBL[9000:Error] ;
 125:  CALL HF_ERRORLOOP    ;
 126:   ;
 127:  LBL[9999:END] ;
/POS
/END
