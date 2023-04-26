/PROG  ROT_SIM
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 975;
CREATE		= DATE 20-06-25  TIME 13:48:58;
MODIFIED	= DATE 20-06-25  TIME 13:48:58;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 15;
MEMORY_SIZE	= 1419;
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
  ENABLE_SINGULARITY_AVOIDANCE   : TRUE;
/MN
   1:  !FANUC America Corp. ;
   2:  !ROBOGUIDE Generated This TPP ;
   3:  !Run SimPRO.cf to setup frame and ;
   4:  UTOOL_NUM[GP1]=1 ;
   5:  UFRAME_NUM[GP1]=0 ;
   6:  LBL[1] ;
   7:L P[1] 2000mm/sec FINE    ;
   8:L P[2] 2000mm/sec FINE    ;
   9:  WAIT    .50(sec) ;
  10:L P[3] 2000mm/sec CNT50    ;
  11:L P[4] 2000mm/sec CNT50    ;
  12:L P[5] 2000mm/sec FINE    ;
  13:  WAIT    .50(sec) ;
  14:L P[6] 2000mm/sec FINE    ;
  15:  JMP LBL[1] ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'U T, 0, 0',
	X =   411.240  mm,	Y =   457.340  mm,	Z =    87.800  mm,
	W =  -180.000 deg,	P =     0.000 deg,	R =    90.000 deg
};
P[2]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'U T, 0, 0',
	X =   422.230  mm,	Y =   456.530  mm,	Z =   -24.560  mm,
	W =  -180.000 deg,	P =     0.000 deg,	R =    90.000 deg
};
P[3]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'U T, 0, 0',
	X =   400.300  mm,	Y =   462.610  mm,	Z =   261.440  mm,
	W =  -180.000 deg,	P =     0.000 deg,	R =    90.000 deg
};
P[4]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'U T, 0, 0',
	X =   525.300  mm,	Y =  -253.330  mm,	Z =   316.840  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg
};
P[5]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'U T, 0, 0',
	X =   538.930  mm,	Y =  -273.390  mm,	Z =   -32.660  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg
};
P[6]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'U T, 0, 0',
	X =   394.300  mm,	Y =   429.610  mm,	Z =   259.800  mm,
	W =  -180.000 deg,	P =     0.000 deg,	R =    90.000 deg
};
/END
