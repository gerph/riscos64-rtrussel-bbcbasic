/*****************************************************************\
*       BBC BASIC for SDL 2.0 (ARM64)                            *
*       Copyright (c) R. T. Russell, 2000-2023                    *
*                                                                 *
*       BBCDAT.S RAM data definitions                             *
*       Version 1.38a, 02-Sep-2023                                *
\*****************************************************************/

.equ	MAXPORTS,4
.equ	MAXFILES,8
.equ	SOUNDQL,20

.global stavar
.global lc
.global oc
.global pc
.global dynvar
.global fnptr
.global proptr
.global prand
.global accs
.global buff
.global vpage
.global flist
.global lomem
.global pfree
.global himem
.global errtxt
.global onersp
.global errtrp
.global datptr
.global curlin
.global errlin
.global tracen
.global vcount
.global vwidth
.global errnum
.global liston
.global lstopt
.global tmps

.global path
.global keystr
.global keybdq
.global keyptr
.global spchan
.global exchan
.global tweak
.global fcbtab
.global timoff
.global usrchr
.global soundq
.global envels
.global waves
.global libase
.global eventq
.global timtrp
.global clotrp
.global siztrp
.global systrp
.global moutrp
.global alltrp
.global iMsg
.global wParam
.global lParam
.global filbuf
.global portab
.global fvtab

.global forgnd
.global bakgnd
.global hfont
.global colmsk
.global modeno
.global lthick
.global hrect
.global origx
.global origy
.global lastx
.global lasty
.global prevx
.global prevy
.global pfont
.global cmcflg
.global textwl
.global textwr
.global textwt
.global textwb
.global sizex
.global sizey
.global sclflg
.global textx
.global texty
.global charx
.global chary
.global cursa
.global cursb
.global tempo
.global pixelx
.global pixely
.global txtfor
.global txtbak
.global optval
.global farray
.global fasize

.global vduq
.global queue
.global flags
.global kbdqw
.global kbdqr
.global keyexp
.global scroln
.global vflags
.global sndqw
.global sndqr
.global sacc
.global smix
.global evtqw
.global evtqr
.global eenvel
.global escale
.global epsect
.global easect
.global epitch
.global elevel
.global ecount

.global hwndProg
.global zoom
.global offsetx
.global offsety
.global platform
.global memhdc
.global prthdc
.global MidiId
.global reflag
.global sysflg
.global panx
.global pany
.global prntx
.global prnty
.global prchx
.global prchy
.global cursx
.global bPaletted
.global paperl
.global paperr
.global papert
.global paperb

.global datend
.global sysvar
.global savesp
.global bbcfont
.global lastick
.global link00
.global cmdlen
.global cmdadr
.global dirlen
.global diradr
.global liblen
.global libadr
.global usrlen
.global usradr
.global tmplen
.global tmpadr
.global hwo
.global vdufmt
.global vduvar
.global vduptr
.global voices
.global hwacc
.global chrmap
.global breakpt
.global breakhi
.global ttxtfont

.data

	.balign	16

/* Variables used by generic modules (bbmain, bbexec, bbeval, bbasmb) */

stavar:.fill	12,4,0	/* Static variables @% to K% */
lc:	.long	0		/* Static variable L% */
	.fill	2,4,0	/* Static variables M%, N% */
oc:	.long	0		/* Static variable O% */
pc:	.long	0		/* Static variable P% */
	.fill	10,4,0		/* Static variables Q% to Z% */
dynvar:.fill	54,4,0		/* ( Pointers to dynamic vars   ) */
fnptr:	.long	0		/* ( Pointer to user FuNctions  ) */
proptr:.long	0		/* ( Pointer to user PROCedures ) */
    .balign 16
accs:	.quad	0		/* Pointer to string accumulator */
vpage:	.long	0		/* Current value of PAGE */
tracen:.long	0		/* Maximum line number to trace */
lomem:	.long	0		/* Current value of LOMEM */
pfree:	.long	0		/* Pointer to start of free space */
himem:	.long	0		/* Current value of HIMEM */
libase:.long	0		/* Pointer to INSTALLed library */
    .balign 16
errtxt:.quad	0		/* Pointer to error text for REPORT */
errtrp:.long	0		/* Pointer to ON ERROR statement */
datptr:.long	0		/* Pointer to DATA statements */
vcount:.long	0		/* Current value of COUNT */
curlin:.long	0		/* Pointer to current statement */
alltrp:			/* Start of trap pointers */
timtrp:.long	0		/* Pointer to ON TIME statement */
clotrp:.long	0		/* Pointer to ON CLOSE statement */
siztrp:.long	0		/* Pointer to ON MOVE statement */
systrp:.long	0		/* Pointer to ON SYS statement */
moutrp:.long	0		/* Pointer to ON MOUSE statement */
errlin:.long	0		/* Pointer to last error statement */

prand:
random:.fill	5,1,0		/* Current 'random' number (5 bytes) */
vwidth:.byte	0		/* Current value of WIDTH */
errnum:.byte	0		/* Error code of last error */
liston:.byte	0		/* *FLOAT / *HEX / *LOWERCASE / OPT */

/* Variables used by OS-specific modules (bbcmos, bbccli, bbcvdu, bbcvtx) */

	.balign	16
path:	.quad	0		/* Pointer to path/filename buffer */
keybdq:.quad	0		/* Pointer to keyboard queue */
keyptr:.quad	0		/* Pointer to *KEY string */

lstopt:.byte	0		/* LISTO value (indentation) */
sclflg:.byte	0		/* Scroll flag (COPY key) */
optval:.byte	0		/* *OUTPUT and *INPUT values */

/* ------ End of 'absolutely-addressed' variables ------ */

farray:.byte	0		/* Number of dimensions = 1  | */
fasize:.long	0		/* Number of elements = 16   | */
filbuf:.quad	0		/* Pointer to file buffers   | */
portab:.fill	MAXPORTS,8,0	/* Table of port handles | */
chntab:.fill	MAXFILES,8,0	/* Table of file handles | */
exchan:.quad	0		/* Handle for *EXEC   @hfile%%(13) */
spchan:.quad	0		/* Handle for *SPOOL  @hfile%%(14) */
ptchan:.quad	0		/* Handle for printer @hfile%%(15) */

fcbtab:.fill	MAXFILES,4,0	/* Table of FCBs */
voices:.byte	0,0,0,0		/* Voices (waveforms) for sound channels */

    .balign 16
flist:	.fill	33,8,0		/* Pointers to string free lists */
tmps:	.long	0		/* Temp string descriptor: address */
	.long	0		/* Temp string descriptor: length */

/* Variables moved here to make room for 64-bit pointers and handles */

    .balign 16
onersp:.quad	0		/* ESP storage for ON ERROR LOCAL */
buff:	.quad	0		/* Pointer to string input buffer */
keystr:.quad	0		/* Pointer to user *KEY strings */
usrchr:.quad	0		/* Pointer to user-defined characters */
waves:	.quad	0		/* Pointer to SOUND waveforms */
envels:.quad	0		/* Pointer to ENVELOPEs */
eventq:.quad	0		/* Pointer to event queue */
hrect:	.quad	0		/* Pointer to clip rect (part of @vdu{}) */

/* Text/graphics metrics (pointed to by @vdu%) */

vduvar:
origx:	.long	0		/* Graphics horizontal origin */
origy:	.long	0		/* Graphics vertical origin */
lastx:	.long	0		/* Immediately preceding x-coordinate */
lasty:	.long	0		/* Immediately preceding y-coordinate */
prevx:	.long	0		/* Previous x-coordinate */
prevy:	.long	0		/* Previous y-coordinate */
textwl:.long	0		/* Text window left (pixels) */
textwr:.long	0		/* Text window right (pixels) */
textwt:.long	0		/* Text window top (pixels) */
textwb:.long	0		/* Text window bottom (pixels) */
pixelx:.long	0		/* Width of a graphics pixel */
pixely:.long	0		/* Height of a graphics pixel */
textx:	.long	0		/* Text pointer (cursor x) */
texty:	.long	0		/* Text pointer (cursor y) */
    .balign 16
hfont:	.quad	0		/* Handle of current font */

forgnd:.short	0		/* Graphics foreground colour/action */
bakgnd:.short	0		/* Graphics background colour/action */

cursa:	.byte	0		/* Start (top) line of cursor */
cursb:	.byte	0		/* Finish (bottom) line of cursor */
txtfor:.byte	0		/* Text foreground colour */
txtbak:.byte	0		/* Text background colour */
modeno:.byte	0		/* Mode number */
colmsk:.byte	0		/* Mask for maximum number of colours */
vflags:.byte	0		/* VDU driver flags */
scroln:.byte	0		/* Scroll counter in paged mode */
cursx:	.byte	0		/* Cursor (caret) width */
lthick:.byte	0		/* Line thickness (lines, outline shapes) */
cmcflg:.byte	0		/* cursor movement flags */
tweak:	.byte	0		/* Character spacing adjustment (signed) */ 

sndqw:	.fill	4,1,0		/* Sound queue write pointers */
sndqr:	.fill	4,1,0		/* Sound queue read pointers */
eenvel:.fill	4,1,0		/* Envelope number */
escale:.fill	4,1,0		/* Envelope scaler */
epsect:.fill	4,1,0		/* Envelope pitch section */
easect:.fill	4,1,0		/* Envelope amplitude section */
epitch:.fill	4,1,0		/* Envelope pitch (frequency) */
ecount:.fill	4,1,0		/* Envelope count */
soundq:.fill	4*SOUNDQL,1,0	/* Sound queue (four channels) */

vduq:	.fill	10,1,0		/* VDU queue (must precede 'queue') */
queue:	.byte	0		/* VDU queue status */

kbdqw:	.byte	0		/* Keyboard queue write pointer */
kbdqr:	.byte	0		/* Keyboard queue read pointer */
evtqw:	.byte	0		/* Event queue write pointer */
evtqr:	.byte	0		/* Event queue read pointer */
keyexp:.byte	0		/* *KEY character counter */

	.balign	4

/* ------ End of initialised variables ------ */

datend:

/* The following locations are NOT initialised when program is RUN */
/* (but are guaranteed to be zero on initial execution). */

sizex:	.long	0		/* Total width of client area */
sizey:	.long	0		/* Total height of client area */
charx:	.long	0		/* Average character width */
chary:	.long	0		/* Average character height */
prchx:	.long	0		/* Average character width (printer) */
prchy:	.long	0		/* Average character height (printer) */
paperl:.long	0		/* Printer left edge */
paperr:.long	0		/* Printer right edge */
papert:.long	0		/* Printer top edge */
paperb:.long	0		/* Printer bottom edge */
prntx:	.long	0		/* Horizontal printing position */
prnty:	.long	0		/* Vertical printing position */

/* ------ End of VDU variables ------ */

lastick:.long	0		/* To check for TickCount wraparound */
timoff:.long	0		/* Offset to add to TickCount */
sacc:	.fill	4,4,0		/* Sound accumulators */
smix:	.fill	4,4,0		/* Stereo mix */
elevel:.fill	4,1,0		/* Envelope level (amplitude) */

/* The following variables are organised as a linked-list at */
/* sysvar, for access via 'system variables' starting with @ */

sysvar:.long	link1 - sysvar
.asciz	"wparam%"
wParam:.long	0		/* Saved wParam for ON xxxx interrupt */

link3:	.long	link4 - link3
	.asciz	"lparam%"
lParam:.long	0		/* Saved lParam for ON xxxx interrupt */

	.byte	0		/* Padding */
link23:	.long	link24 - link23
	.asciz	"ispal%"
bPaletted: .long	0	/* Paletted display flag (BOOL) */

	.fill	7,1,0		/* Padding */
link1:	.long	link3 - link1
	.asciz	"memhdc%%"/* n.b. aliased to @memhdc% */
memhdc:.quad	0		/* Shadow screen device context */

	.fill	7,1,0		/* Padding */
link9:	.long	link10 - link9
	.asciz	"msg%"
iMsg:	.long	0		/* Saved iMsg for ON xxxx interrupt */

	.byte	0		/* Padding */
link4:	.long	link5 - link4
	.asciz	"hwnd%%"	/* n.b. aliased to @hwnd% */
hwndProg: .quad	0	/* Handle for program window */

	.fill	5,1,0		/* Padding */
link12:	.long	link13 - link12
	.asciz	"flags%"
tempo:	.byte	0		/* *TEMPO value */
sysflg:.byte	0		/* *SYS flags */
reflag:.byte	0		/* *REFRESH flags */
flags:	.byte	0		/* Boolean flags (byte) */

	.fill	7,1,0		/* Padding */
link16:	.long	link17 - link16
	.asciz	"chrmap%%"	/* n.b. aliased to @chrmap% */
chrmap:.quad	0

	.fill	5,1,0		/* Padding */
link5:	.long	link6 - link5
	.asciz	"hpal%%"
	.quad	palette	/* Colour palette */

	.fill	6,1,00		/* Padding */
link10:	.long	link11 - link10
	.asciz	"vdu%%"
	.quad	vduvar		/* Pointer to VDU variables */

	.fill	6,1,00		/* Padding */
link00:.long	0		/* End of list */
	.asciz	"fn%%("
	.quad	fnarr		/* Pointer to function array */

	.short	0		/* Padding */
link11:	.long	link12 - link11
	.asciz	"platform%"
platform: .long 0		/* SDL version & OS */

	.long	0		/* Padding */
link6:	.long	link7 - link6
	.asciz	"ox%"	
offsetx:.long	0		/* x-offset memhdc->hwnd */

	.long	0		/* Padding */
link7:	.long	link8 - link7
	.asciz	"oy%"	 
offsety:.long	0		/* y-offset memhdc->hwnd */

	.fill	3,1,00		/* Padding */
link17:	.long	link18 - link17
	.asciz	"dir$"
diradr:.long	0		/* Program directory address */
dirlen:.long	0		/* Program directory length */

	.fill	7,1,00		/* Padding */
link18:	.long	link19 - link18
	.asciz	"lib$"
libadr:.long	0		/* Library directory address */
liblen:.long	0		/* Library directory length */

	.fill	6,1,00		/* Padding */
link24:	.long	link25 - link24
	.asciz	"panx%"
panx:	.long	0		/* Horizontal pan */

	.fill	3,1,00		/* Padding */
link19:	.long	link20 - link19
	.asciz	"cmd$"
cmdadr:.long	0		/* Command line address */
cmdlen:.long	0		/* Command line length */

	.fill	7,1,00		/* Padding */
link20:	.long	link21 - link20
	.asciz	"usr$"
usradr:.long	0		/* User directory address */
usrlen:.long	0		/* User directory length */

	.fill	6,1,00		/* Padding */
link25:	.long	link26 - link25
	.asciz	"pany%"
pany:	.long	0		/* Vertical pan */

	.fill	3,1,00		/* Padding */
link21:	.long	link22 - link21
	.asciz	"tmp$"
tmpadr:.long	0		/* Temp directory address */
tmplen:.long	0		/* Temp directory length */

	.fill	7,1,00		/* Padding */
link22:	.long	link23 - link22
	.asciz	"vdu{"
	.quad	vdufmt		/* Structure format address */
	.quad	hrect		/* Structure data address */

	.fill	6,1,00		/* Padding */
link14:	.long	link15 - link14
	.asciz	"zoom%"
zoom:	.long	0

	.fill	7,1,00		/* Padding */
link8:	.long	link9 - link8
	.asciz	"hfile%%("
	.quad	farray		/* Pointer to file handles array */

	.fill	5,1,00		/* Padding */
link26:	.long	link27 - link26
	.asciz	"brkpt%"
breakpt:.long	0		/* Breakpoint (bottom of range) */

	.fill	3,1,00		/* Padding */
link15:	.long	link16 - link15
	.asciz	"hwo%"
hwo:	.long	0		/* Handle for wave output */

	.byte	0		/* Padding */
link27:	.long	link28 - link27
	.asciz	"brkhi%"
breakhi:.long	0		/* Breakpoint (top of range) */

	.short	0		/* Padding */
link28:	.long	link29 - link28
	.asciz	"size{"
	.quad	ptfmt
	.quad	sizex

	.short	0		/* Padding */
	.long	0
link29:	.long	link00 - link29
	.asciz	"char{"
	.quad	ptfmt
	.quad	charx

	.long	0		/* Padding */
link13:	.long	link14 - link13
	.asciz	"cache%%"
	.quad	TTFcache	/* Font cache */

/* Structure @vdu{o{x%,y%}, l{x%,y%}, p{x%,y%}, tl%, tr%, tt%, tb%, */
/*d{x%,y%}, c{x%,y%}, hf%%, hr%%,   */
/*g{a&,b&,c&,d&}, t{a&,b&,c&,d&}, m{a&,b&,c&,d&}}   */

	.byte	0		/* Padding */
	.long	0
vdufmt:	.long	sndqw-hrect	/* Total length (bytes) */
vlnk00:	.long	vlnk01 - vlnk00	/* Link to next */
	.asciz	"o{"		/* Member name */
	.quad	ptfmt
	.quad	origx-hrect	/* Data offset */

	.byte	0		/* Padding */
vlnk01:	.long	vlnk02 - vlnk01
	.asciz	"l{"		/* Member name */
	.quad	ptfmt
	.quad	lastx-hrect	/* Data offset */

	.byte	0		/* Padding */
vlnk02:	.long	vlnk03 - vlnk02
	.asciz	"p{"		/* Member name */
	.quad	ptfmt
	.quad	prevx-hrect	/* Data offset */

vlnk03:	.long	vlnk04 - vlnk03
	.asciz	"tl%"		/* Member name */
	.long	textwl-hrect	/* Data offset */

	.long	0		/* Padding */
vlnk04:	.long	vlnk05 - vlnk04
	.asciz	"tr%"		/* Member name */
	.long	textwr-hrect	/* Data offset */

	.long	0		/* Padding */
vlnk05:	.long	vlnk06 - vlnk05
	.asciz	"tt%"		/* Member name */
	.long	textwt-hrect	/* Data offset */

	.long	0		/* Padding */
vlnk06:	.long	vlnk07 - vlnk06
	.asciz	"tb%"		/* Member name */
	.long	textwb-hrect	/* Data offset */

	.fill	5,1,00		/* Padding */
vlnk07:	.long	vlnk08 - vlnk07
	.asciz	"d{"		/* Member name */
	.quad	ptfmt
	.quad	pixelx-hrect	/* Data offset */

	.byte	0		/* Padding */
vlnk08:	.long	vlnk09 - vlnk08
	.asciz	"c{"		/* Member name */
	.quad	ptfmt
	.quad	textx-hrect	/* Data offset */

	.fill	7,1,00		/* Padding */
vlnk09:	.long	vlnk10 - vlnk09
	.asciz	"hf%%"		/* Member name */
	.long	hfont-hrect	/* Data offset */

	.fill	3,1,00		/* Padding */
vlnk10:	.long	vlnk11 - vlnk10
	.asciz	"hr%%"		/* Member name */
	.long	hrect-hrect	/* Data offset */

	.fill	5,1,00		/* Padding */
vlnk11:	.long	vlnk12 - vlnk11
	.asciz	"g{"		/* Member name */
	.quad	b4fmt
	.quad	forgnd-hrect	/* Data offset */

	.byte	0		/* Padding */
vlnk12:	.long	vlnk13 - vlnk12
	.asciz	"t{"		/* Member name */
	.quad	b4fmt
	.quad	cursa-hrect	/* Data offset */

	.byte	0		/* Padding */
vlnk13:	.long	vlnk14 - vlnk13
	.asciz	"m{"		/* Member name */
	.quad	b4fmt
	.quad	modeno-hrect	/* Data offset */

	.byte	0		/* Padding */
vlnk14:	.long	0
	.asciz	"w{"		/* Member name */
	.quad	b4fmt
	.quad	cursx-hrect	/* Data offset */

/* Structure {x%,y%} */

ptfmt:	.long	8		/* Total length (bytes) */
ptlnk0:	.long	ptlnk1-ptlnk0	/* Link to next member */
	.asciz	"x%"		/* Member name */
	.long	0		/* Member offset (bytes) */
ptlnk1:	.long	0		/* Terminating link */
	.asciz	"y%"		/* Member name */
	.long	4		/* Member offset (bytes) */

/* Structure {a&,b&,c&,d&} */

b4fmt:	.long	4		/* Total length (bytes) */
b4lnk0:	.long	b4lnk1-b4lnk0	/* Link to next member */
	.asciz	"a&"		/* Member name */
	.long	0		/* Member offset (bytes) */
b4lnk1:	.long	b4lnk2-b4lnk1	/* Link to next member */
	.asciz	"b&"		/* Member name */
	.long	1		/* Member offset (bytes) */
b4lnk2:	.long	b4lnk3-b4lnk2	/* Link to next member */
	.asciz	"c&"		/* Member name */
	.long	2		/* Member offset (bytes) */
b4lnk3:	.long	0		/* Terminating link */
	.asciz	"d&"		/* Member name */
	.long	3		/* Member offset (bytes) */

/* Array of function entry points */

	.fill	1,1,0		/* Padding */
fnarr:	.byte	1		/* Number of dimensions */
	.long	22  		/* Number of entries */
fnarr0:	.quad	loadn		/* Load numeric  */
	.quad	loads		/* Load string */
	.quad	storen		/* Store numeric */
	.quad	stores		/* Store string */
	.quad	getvar		/* Get variable address */
	.quad	putvar		/* Create variable */
	.quad	expr		/* Evaluate expression */
	.quad	item		/* Evaluate item */
	.quad	lexan		/* Lexical analysis (tokenise) */
	.quad	token		/* Print character or keyword */
	.quad	xfloat		/* Convert integer to float */
	.quad	xfix		/* Convert float to integer */
	.quad	str00		/* Convert a number to a string */
	.quad	con		/* Convert a string to a number */
	.quad	sortup		/* Sort ascending (used by sortlib) */
	.quad	sortdn		/* Sort descending (used by sortlib) */
	.quad	hook		/* Timer callback (used by timerlib) */
	.quad	xeq		/* Return to BASIC */
	.quad	putevt		/* Store event in queue */
	.quad	gfxPrimitivesGetFont
	.quad	gfxPrimitivesSetFont
	.quad	RedefineChar
fnarrt:

	.text

fvtab:	.byte	1		/* &19 v&  Unsigned byte (8 bits) */
	.byte	4		/* &1A v%  Signed dword (32 bits) */
	.byte	8		/* &1B v#  Float double (64 bits) */
	.byte	10		/* &1C v   Variant numeric (80 bits) */
	.byte	16		/* &1D v{} Structure (8+8 bytes) */
	.byte	40		/* &1E v%% Signed qword (64 bits) */
	.byte	136		/* &1F v$  String (4+4 bytes) */

