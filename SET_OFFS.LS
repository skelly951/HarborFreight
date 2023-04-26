/PROG  SET_OFFS
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 408;
CREATE		= DATE 20-10-28  TIME 10:04:52;
MODIFIED	= DATE 21-04-22  TIME 13:24:40;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 14;
MEMORY_SIZE	= 724;
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
   1:  !Set Position offset ;
   2:  !Use PR[1] for a user offset ;
   3:  !Use PR[2] for a tool offset ;
   4:  R[395:SetOffs]=AR[7]    ;
   5:   ;
   6:  PR[R[395],1]=AR[1]    ;
   7:  PR[R[395],2]=AR[2]    ;
   8:  PR[R[395],3]=AR[3]    ;
   9:  PR[R[395],4]=AR[4]    ;
  10:  PR[R[395],5]=AR[5]    ;
  11:  PR[R[395],6]=AR[6]    ;
  12:   ;
  13:  OFFSET CONDITION PR[1:UFrame Offset]    ;
  14:  TOOL_OFFSET CONDITION PR[2:Tool Offset]    ;
/POS
/END
