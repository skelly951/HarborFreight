/PROG  HF_PICK_PRS
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "SET 100 PR";
PROG_SIZE	= 1703;
CREATE		= DATE 22-01-10  TIME 13:57:18;
MODIFIED	= DATE 22-01-10  TIME 13:57:18;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 86;
MEMORY_SIZE	= 2127;
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
   1:  !********************* ;
   2:  !Set Pick Positions ;
   3:  !********************* ;
   4:   ;
   5:  !Set Master Pick Position ;
   6:  UFRAME_NUM=0 ;
   7:  CALL SET_OFFS(0,0,0,(-180),0,0,1) ;
   8:   ;
   9:  PR[255:1100 UF1 Offset]=PR[254:1100 Master Pick]+PR[1:UFrame Offset]    ;
  10:   ;
  11:  PR[255,3:1100 UF1 Offset]=PR[255,3:1100 UF1 Offset]+R[273]    ;
  12:   ;
  13:  UFRAME[1]=PR[255:1100 UF1 Offset] ;
  14:   ;
  15:  !UserFrame 1 ;
  16:  UFRAME_NUM=1 ;
  17:   ;
  18:  !Initial Ap Pk ;
  19:  R[396:Z Offset Temp]=R[278:Pick Buffer]+R[205:CMD_PRM_3_IFM]    ;
  20:   ;
  21:  IF R[396:Z Offset Temp]>300,JMP LBL[5] ;
  22:   ;
  23:  R[396:Z Offset Temp]=R[278:Pick Buffer]+R[205:CMD_PRM_3_IFM]+300    ;
  24:   ;
  25:  LBL[5] ;
  26:   ;
  27:  CALL SET_OFFS(R[285:PK Offset:X(UF1)],R[286:PK Offset:Y(UF1)],R[396:Z Offset Temp],180,0,0,1) ;
  28:   ;
  29:  PR[220:INIT APP PK]=PR[1:UFrame Offset]    ;
  30:   ;
  31:  !Final Apr Pk ;
  32:  CALL SET_OFFS(0,0,R[396:Z Offset Temp],180,0,0,1) ;
  33:  PR[223:FINAL APP PK]=PR[1:UFrame Offset]    ;
  34:   ;
  35:  !Pick ;
  36:  R[396:Z Offset Temp]=R[205:CMD_PRM_3_IFM]-R[274:Press Dist]    ;
  37:   ;
  38:  CALL SET_OFFS(0,0,R[396:Z Offset Temp],180,0,0,1) ;
  39:   ;
  40:  PR[224:PICK]=PR[1:UFrame Offset]    ;
  41:   ;
  42:  !Initial Depart Pk ;
  43:  IF R[215:Box Height]>610,JMP LBL[9] ;
  44:  !Cases <24" : Case Ht Retract ;
  45:  R[396:Z Offset Temp]=R[205:CMD_PRM_3_IFM]+R[278:Pick Buffer]+R[215:Box Height]    ;
  46:   ;
  47:  IF R[396:Z Offset Temp]>R[283:Minimum PK Dprt],JMP LBL[10] ;
  48:   ;
  49:  R[396:Z Offset Temp]=R[283:Minimum PK Dprt]+R[215:Box Height]+R[282:Clearance Buffer]    ;
  50:   ;
  51:  LBL[10] ;
  52:  JMP LBL[15] ;
  53:   ;
  54:  LBL[9] ;
  55:  !Cases >24" : Max Ht Retract ;
  56:  IF R[205:CMD_PRM_3_IFM]>765,JMP LBL[11] ;
  57:   ;
  58:  R[396:Z Offset Temp]=R[205:CMD_PRM_3_IFM]+R[278:Pick Buffer]+R[215:Box Height]    ;
  59:   ;
  60:  JMP LBL[15] ;
  61:  LBL[11] ;
  62:   ;
  63:  R[396:Z Offset Temp]=R[284]    ;
  64:   ;
  65:  LBL[15] ;
  66:   ;
  67:  CALL SET_OFFS(0,0,R[396:Z Offset Temp],180,0,0,1) ;
  68:   ;
  69:  PR[226:INIT DEP PK]=PR[1:UFrame Offset]    ;
  70:   ;
  71:  !Final Depart Pk ;
  72:  CALL SET_OFFS(R[285:PK Offset:X(UF1)],R[286:PK Offset:Y(UF1)],0,0,0,0,1) ;
  73:   ;
  74:  PR[229:FINAL DEP PK]=PR[226:INIT DEP PK]+PR[1:UFrame Offset]    ;
  75:   ;
  76:   ;
  77:  !ENSURE NO OVERPRESS ;
  78:  //IF R[274:Press Dist]>=R[207:CMD_PRM_5_Ht],JMP LBL[500] ;
  79:   ;
  80:  JMP LBL[9999] ;
  81:  LBL[500] ;
  82:   ;
  83:  PR[224,3:PICK]=PR[254,3:1100 Master Pick]-R[205:CMD_PRM_3_IFM]+15    ;
  84:   ;
  85:   ;
  86:  LBL[9999] ;
/POS
/END
