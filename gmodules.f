      MODULE GLOBAL
        integer, PARAMETER :: NIUNIT=100
        integer,save::iunsat
        INTEGER,SAVE ::NCOL,NROW,NLAY,NPER,NBOTM,NCNFBD,IVSD
        INTEGER, SAVE ::ITMUNI,LENUNI,IXSEC,ITRSS,INBAS,IUNSTR
        INTEGER, SAVE :: IDEALLOC_LPF,IDEALLOC_HY,ISYMFLG
        INTEGER, SAVE :: ITRNSP,NEQS,NODES,NJA,NJAS,NJAG
        INTEGER, SAVE :: IOUT,IPRCONN,IDSYMRD,ILAYCON4,IWADI,      
     *   IWADICLN,IDPF,IDPT,INSGB, ImdT,IDPIN,IDPOUT,IHMSIM,IUIHM,ISYALL
        INTEGER, SAVE :: INCLN,INGNC,INGNC2,INGNCn, INDDF
        INTEGER, SAVE :: INSWF
        INTEGER, SAVE :: IFMBC,MBEGWUNF,MBEGWUNT,MBECLNUNF,        
     *   MBECLNUNT,IOUTNORMAL 
        INTEGER, SAVE ::IFREFM,MXNODLAY,ICONCV,NOVFC
        INTEGER, SAVE, ALLOCATABLE :: NOCVCO
        DOUBLE PRECISION, SAVE::WADIEPS
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::IUNIT(:)
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::IBOUND
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::IA
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::IAG
        REAL*8, DIMENSION(:),ALLOCATABLE  :: FLOWJA(:),FMBE(:)
        INTEGER, DIMENSION(:),ALLOCATABLE :: IATMP
        INTEGER :: NJATMP
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::JA
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE ::JAFL          
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::JAS
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::ISYM
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::IVC
        DOUBLE PRECISION, SAVE, DIMENSION(:),ALLOCATABLE  ::HOLD
        DOUBLE PRECISION, SAVE, DIMENSION(:),ALLOCATABLE  ::HNEW
        DOUBLE PRECISION, SAVE, DIMENSION(:), ALLOCATABLE ::RHS
        DOUBLE PRECISION, SAVE, DIMENSION(:),ALLOCATABLE ::AMAT
        DOUBLE PRECISION, SAVE, DIMENSION(:), ALLOCATABLE ::Sn,So
        DOUBLE PRECISION, SAVE, DIMENSION(:), ALLOCATABLE ::AKRC,AKR
        DOUBLE PRECISION, SAVE, DIMENSION(:), ALLOCATABLE ::TURBGRAD
        REAL, DIMENSION(:),ALLOCATABLE  ::DELR
        REAL, DIMENSION(:),ALLOCATABLE  ::DELC
        DOUBLE PRECISION, SAVE, DIMENSION(:),ALLOCATABLE  ::BOT
        DOUBLE PRECISION, SAVE, DIMENSION(:),ALLOCATABLE  ::TOP
        DOUBLE PRECISION, SAVE, DIMENSION(:),ALLOCATABLE  ::PGF
        DOUBLE PRECISION, SAVE, DIMENSION(:),ALLOCATABLE  ::AREA
        REAL, SAVE, DIMENSION(:),ALLOCATABLE  ::FAHL        
        REAL, SAVE, DIMENSION(:),ALLOCATABLE  ::CL1,CL2
        REAL, SAVE, DIMENSION(:),ALLOCATABLE  ::ARAD
        INTEGER, SAVE,    DIMENSION(:),    ALLOCATABLE  ::NODLAY
        INTEGER, SAVE,  ALLOCATABLE,   DIMENSION(:)     ::LAYNOD
        INTEGER, DIMENSION(:),    ALLOCATABLE  ::LAYCBD
        INTEGER, SAVE,    DIMENSION(:),    ALLOCATABLE  ::LAYHDT
        INTEGER, SAVE,    DIMENSION(:),    ALLOCATABLE  ::LAYHDS
        DOUBLE PRECISION,  SAVE, DIMENSION(:),  ALLOCATABLE  ::PERLEN
        INTEGER, SAVE,    DIMENSION(:),    ALLOCATABLE  ::NSTP
        REAL,    SAVE,    DIMENSION(:),    ALLOCATABLE  ::TSMULT
        INTEGER, SAVE,    DIMENSION(:),    ALLOCATABLE  ::ISSFLG
        REAL,    SAVE,    DIMENSION (:),   ALLOCATABLE  :: STORFRAC
        REAL,    SAVE,    DIMENSION(:),ALLOCATABLE  ::BUFF
        REAL,    SAVE,    DIMENSION(:),ALLOCATABLE  ::STRT
        DOUBLE PRECISION,  SAVE,  ALLOCATABLE,   DIMENSION(:) ::HWADI
        DOUBLE PRECISION,  SAVE,  ALLOCATABLE,   DIMENSION(:) ::DWADI
        REAL,    SAVE,    DIMENSION(:),ALLOCATABLE ::DDREF
        INTEGER,           SAVE, DIMENSION(:),  ALLOCATABLE ::NODETIBH
        INTEGER :: NIB1
        DOUBLE PRECISION, SAVE, DIMENSION(:),ALLOCATABLE  ::HTIB
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::IA2
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::JA2
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::IA1IA2
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::JA1JA2
        INTEGER, SAVE :: NEQS2,NJA2
      END MODULE GLOBAL
C
C -----------------------------------------------------------------------
      MODULE NAMEFILEMODULE
        CHARACTER*300 SYFNAME, fnames(5000)
        INTEGER SYIU,SYIFLEN,ius(5000),iflens(5000),nfiles,IARCVs(5000)
        CHARACTER*4 CUNITs(5000)
        CHARACTER*7 FILSTATs(5000)
        CHARACTER*20 FILACTs(5000), FMTARGs(5000), ACCARGs(5000)
      END MODULE NAMEFILEMODULE
C
C------------------------------------------------------------------
      MODULE PARAMMODULE
C  Data definitions for Named Parameters
C  Explicitly declare all variables to enable subroutines that include
C  this file to use the IMPLICIT NONE statement.
        INTEGER, PARAMETER :: MXPAR=999,MXCLST=1000,MXINST=1000
        INTEGER,SAVE ::ICLSUM,IPSUM,INAMLOC,NMLTAR,NZONAR,NPVAL
        REAL,          SAVE,    DIMENSION(:),    ALLOCATABLE ::B
        INTEGER,       SAVE,    DIMENSION(:),    ALLOCATABLE ::IACTIVE
        INTEGER,       SAVE,    DIMENSION(:,:),  ALLOCATABLE ::IPLOC
        INTEGER,       SAVE,    DIMENSION(:,:),  ALLOCATABLE ::IPCLST
        INTEGER,       SAVE,    DIMENSION(:,:,:),ALLOCATABLE ::IZON
        REAL,          SAVE,    DIMENSION(:,:,:),ALLOCATABLE ::RMLT
        CHARACTER(LEN=10),SAVE, DIMENSION(:),    ALLOCATABLE ::PARNAM
        CHARACTER(LEN=4), SAVE, DIMENSION(:),    ALLOCATABLE ::PARTYP
        CHARACTER(LEN=10),SAVE, DIMENSION(:),    ALLOCATABLE ::ZONNAM
        CHARACTER(LEN=10),SAVE, DIMENSION(:),    ALLOCATABLE ::MLTNAM
        CHARACTER(LEN=10),SAVE, DIMENSION(:),    ALLOCATABLE ::INAME
      END MODULE PARAMMODULE
C
C -----------------------------------------------------------------------
      MODULE GWFBASMODULE
        INTEGER, SAVE  ::MSUM
        INTEGER, SAVE  ::IHEDFM,IHEDUN,IDDNFM,IDDNUN,IBOUUN,
     *    ISPCFM,ISPCUN
        INTEGER, SAVE  ::LBHDSV,LBDDSV,LBBOSV
        INTEGER, SAVE  ::IBUDFL,ICBCFL,IHDDFL,ISPCFL,
     *   IAUXSV,IBDOPT,IATS,IBUDFLAT,ICBCFLAT,IHDDFLAT,ISPCFLAT
        INTEGER, SAVE :: IFAST,ISPFAST,ITSFAST,IUGFAST,IUCFAST,
     *    IUDFAST,IFASTH,IFASTC,ISPFASTC,ITSFASTC,IUGFASTC,IUCFASTC,
     *    IUDFASTC,IUMFASTC  
        INTEGER, SAVE  ::IPRTIM,IPEROC,ITSOC,ICHFLG,IFRCNVG
        DOUBLE PRECISION,  SAVE  ::DELT,PERTIM,TOTIM
        DOUBLE PRECISION, SAVE :: DELTAT,TMINAT,TMAXAT,TADJAT,
     1        TCUTAT
        INTEGER, SAVE ::NPTIMES,NPSTPS,ITIMOT,ITIMOTC,
     1    IUGBOOT,IUCBOOT,IUDBOOT,IBOOT,IBOOTSCALE
        DOUBLE PRECISION, SAVE :: DTBOOTSCALE
        DOUBLE PRECISION, DIMENSION(:),ALLOCATABLE  ::BOOTSLOPE
        DOUBLE PRECISION, DIMENSION(:),ALLOCATABLE  ::BOOTSCALE
        DOUBLE PRECISION, DIMENSION(:),ALLOCATABLE  ::HREADBOOT       
        DOUBLE PRECISION,  SAVE, DIMENSION(:),ALLOCATABLE ::TIMOT,TIMOTC
        REAL,              SAVE  ::HNOFLO
        CHARACTER(LEN=20), SAVE   ::CHEDFM,CDDNFM,CBOUFM,CSPCFM
        INTEGER,           SAVE, DIMENSION(:,:), ALLOCATABLE ::IOFLG
        DOUBLE PRECISION,  SAVE, DIMENSION(:,:), ALLOCATABLE ::VBVL
        CHARACTER(LEN=16), SAVE, DIMENSION(:),   ALLOCATABLE ::VBNM
        INTEGER, SAVE  ::IDDREF,IDDREFNEW
        INTEGER,           SAVE, DIMENSION(:),  ALLOCATABLE  ::IFLUSHS !kkz for list of binary output unit numbers to flush
        INTEGER,           SAVE   ::CFLUSH !kkz - count of binary file unit numbers to flush at ends of time steps        
      END MODULE GWFBASMODULE
C
C -----------------------------------------------------------------------
      MODULE GWFBCFMODULE
       INTEGER,SAVE ::IBCFCB,IWDFLG,IWETIT,IHDWET,IKCFLAG,
     1  IKVFLAG,IBPN,IDRY,ITABRICH,INTRICH,NUTABROWS,NUZONES 
       REAL, SAVE    ::WETFCT,HDRY
       INTEGER, SAVE,  ALLOCATABLE,   DIMENSION(:)     ::LAYCON
       INTEGER, SAVE,  ALLOCATABLE,   DIMENSION(:)     ::LAYAVG,LAYAVGV
       REAL, SAVE,     ALLOCATABLE,   DIMENSION(:) ::CV
       REAL, SAVE,     ALLOCATABLE,   DIMENSION(:) ::SC1
       REAL, SAVE,     ALLOCATABLE,   DIMENSION(:) ::SC2
       REAL, SAVE,     ALLOCATABLE,   DIMENSION(:) ::WETDRY
       REAL, SAVE,  ALLOCATABLE,   DIMENSION(:) ::alpha,beta,sr,brook,BP
       INTEGER, SAVE, ALLOCATABLE, DIMENSION(:) :: IUZONTAB
       REAL, SAVE, ALLOCATABLE, DIMENSION(:,:,:) :: RETCRVS
       INTEGER, SAVE,   ALLOCATABLE, DIMENSION(:)     ::LAYWET
C
        INTEGER, SAVE ::ISFAC,ITHFLG,IHANISO,IALTSTO
        INTEGER, SAVE,   ALLOCATABLE, DIMENSION(:)     ::LAYTYP
        REAL,    SAVE,   ALLOCATABLE, DIMENSION(:)     ::CHANI
        INTEGER, SAVE,   ALLOCATABLE, DIMENSION(:)     ::LAYVKA
        INTEGER, SAVE,   ALLOCATABLE, DIMENSION(:)     ::LAYSTRT
        INTEGER, SAVE,   ALLOCATABLE, DIMENSION(:,:)   ::LAYFLG
        REAL,    SAVE,   ALLOCATABLE, DIMENSION(:) ::VKA
        REAL,    SAVE,   ALLOCATABLE, DIMENSION(:) ::VKCB
        REAL,    SAVE,   ALLOCATABLE, DIMENSION(:) ::HANI
        REAL,    SAVE,   ALLOCATABLE, DIMENSION(:) ::HK
        DOUBLE PRECISION,  SAVE,  ALLOCATABLE,  DIMENSION(:) :: HWADIGW 
        DOUBLE PRECISION,  SAVE,  ALLOCATABLE,  DIMENSION(:) :: DWADIGW
      END MODULE GWFBCFMODULE
C 
C -------------------------------------------------------------------------------------
      MODULE CLN1MODULE
        INTEGER, SAVE :: NCLN,ICLNCB,ICLNHD,ICLNDD,ICLNIB,
C    1           NJA_CLN, NCLNNDS,NCLNGWC,NCONDUITYP,NRECTYP,            !aq CLN CCF
     1           NJA_CLN, NCLNNDS,NCLNGWC,NCONDUITYP,NRECTYP,ICLNTIB,    !aq CLN CCF
     2           ICLNPCB,ICLNGWCB,                                       !aq CLN CCF
     1           ICLNCN,ICLNMB,IBHETYP
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::NNDCLN
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::IFLINCLN
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::ICCWADICLN
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::ICGWADICLN
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::CLNCON
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::IA_CLN
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::JA_CLN
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::IDXGLO_CLN
        DOUBLE PRECISION, SAVE,    DIMENSION(:,:),ALLOCATABLE  ::ACLNNDS
        REAL, SAVE,    DIMENSION(:,:),ALLOCATABLE  ::ACLNGWC
        DOUBLE PRECISION, SAVE,   DIMENSION(:,:),ALLOCATABLE  ::ACLNCOND
        REAL, SAVE,    DIMENSION(:,:),ALLOCATABLE  :: BHEPROP
         REAL, SAVE,    DIMENSION(:,:),ALLOCATABLE  ::ACLNREC
C-------FOR FLOW TO DRY CELL FORMULATION        
        DOUBLE PRECISION,  SAVE, ALLOCATABLE,  DIMENSION(:) ::HWADICC
        DOUBLE PRECISION,  SAVE, ALLOCATABLE,  DIMENSION(:) ::HWADICG
        DOUBLE PRECISION,  SAVE, ALLOCATABLE,  DIMENSION(:) ::DWADICC
        DOUBLE PRECISION,  SAVE, ALLOCATABLE,  DIMENSION(:) ::DWADICG
C-------FOR TURBULENT FLOW FORMULATION 
        REAL, SAVE :: GRAV, VISK
        
      END MODULE CLN1MODULE
      
      MODULE SWF1MODULE
        INTEGER, SAVE, POINTER :: ISWFCB,ISWFHD,ISWFDD,ISWFIB,
     1           NJA_SWF,NSWFNDS,NSWFGWC,NSWFTYP,ISWFTIB,
     1           ISWFPCB,ISWFGWCB,
     1           ISWFCN,ISWFMB
        DOUBLE PRECISION :: MIN_DEPTH = 1.0D-8
        INTEGER, SAVE,    DIMENSION(:),POINTER  ::IA_SWF
        INTEGER, SAVE,    DIMENSION(:),POINTER  ::JA_SWF
        INTEGER, SAVE,    DIMENSION(:),POINTER  ::IDXGLO_SWF
C
        DOUBLE PRECISION, SAVE,    DIMENSION(:,:),ALLOCATABLE  ::ASWFNDS
        REAL, SAVE,    DIMENSION(:,:),ALLOCATABLE  ::ASWFGWC
        DOUBLE PRECISION, SAVE,   DIMENSION(:,:),ALLOCATABLE  ::ASWFCOND
        !REAL, SAVE,  ALLOCATABLE,   DIMENSION(:) :: BOTSWF
        !REAL, SAVE,  ALLOCATABLE,   DIMENSION(:) :: AREASWF
        !REAL, SAVE,  ALLOCATABLE,   DIMENSION(:) :: CLSGSWF
        !REAL, SAVE,  ALLOCATABLE,   DIMENSION(:) :: MANNSWF
        !REAL, SAVE,  ALLOCATABLE,   DIMENSION(:) :: MICHSWF
C        
        REAL, SAVE, DIMENSION(:),ALLOCATABLE  ::FAHL_SWF        
        REAL, SAVE, DIMENSION(:),ALLOCATABLE  ::CL1_SWF,CL2_SWF,CL12_SWF
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::ISSWADISWF
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::ISGWADISWF
        INTEGER, SAVE,    DIMENSION(:),ALLOCATABLE  ::IFLINSWF
      END MODULE SWF1MODULE
      
      
C
C -------------------------------------------------------------------------------------
      MODULE SMSMODULE
      IMPLICIT NONE
      DOUBLE PRECISION, PARAMETER :: EPSILON = 1.0E-6
      DOUBLE PRECISION, PARAMETER :: CLOSEZERO = 1.0E-15      
      DOUBLE PRECISION, SAVE :: Theta
      DOUBLE PRECISION, SAVE :: Akappa, Gamma, Amomentum,
     *  Breduc, Btol,RES_LIM
      DOUBLE PRECISION, SAVE, DIMENSION(:), ALLOCATABLE ::AMATFL
      DOUBLE PRECISION, SAVE :: HCLOSE, HICLOSE,BIGCHOLD,BIGCH
      INTEGER, SAVE :: ITER1,MXITER,LINMETH,NONMETH,Numtrack,
     *  IPRSMS,IBFLAG     
      DOUBLE PRECISION, DIMENSION(:),ALLOCATABLE  :: CELLBOTMIN
      DOUBLE PRECISION, DIMENSION(:),ALLOCATABLE  ::HTEMP
CSP - THIS IS AMAT      DOUBLE PRECISION, SAVE, DIMENSION(:), ALLOCATABLE :: A
CSP - THIS IS RHS      DOUBLE PRECISION, SAVE, DIMENSION(:), ALLOCATABLE :: B
CSP - THIS IS HNEW      DOUBLE PRECISION, SAVE, DIMENSION(:), ALLOCATABLE :: Hchange
      INTEGER, SAVE, DIMENSION(:,:), ALLOCATABLE ::  Lrch
      INTEGER, SAVE, DIMENSION(:), ALLOCATABLE ::  LrchL
      DOUBLE PRECISION, SAVE, DIMENSION(:), ALLOCATABLE :: Hncg
      DOUBLE PRECISION, SAVE, DIMENSION(:), ALLOCATABLE ::  HNCGL
      DOUBLE PRECISION, SAVE, DIMENSION(:), ALLOCATABLE :: DKDH,DKDHC
      DOUBLE PRECISION, SAVE, DIMENSION(:), ALLOCATABLE :: DTURBGRAD
      DOUBLE PRECISION,SAVE,DIMENSION(:),ALLOCATABLE::DEold,Wsave,Hchold
      INTEGER ISOLVEACTIVE, IBOTAV,ISHIFT
      double precision scalfact
      ! DM: Forcing term variables
      DOUBLE PRECISION, SAVE ::Rcutoff,ForcingAlpha,ForcingGamma
      DOUBLE PRECISION, SAVE::MaxRcutoff
      INTEGER, SAVE      ::ICUTOFF,NoMoreRcutoff,ITRUNCNEWTON
      ! End DM
      END MODULE SMSMODULE
C
C--------------------------------------------------------------------------
      MODULE TVMU2MODULE
          INTEGER,SAVE :: ITVMPRINT,NTVMHK,NTVMVKA,NTVMSS,NTVMSY,NTVMPOR
          INTEGER,SAVE :: NTVMSCHANGES
          INTEGER,SAVE :: NTVMDDFTR
          INTEGER,SAVE :: IHAVESC2
          INTEGER,SAVE,ALLOCATABLE,DIMENSION(:) :: ITVMHK,ITVMVKA
          INTEGER,SAVE,ALLOCATABLE,DIMENSION(:) :: ITVMSS,ITVMSY
          INTEGER,SAVE,ALLOCATABLE,DIMENSION(:) :: ITVMPOR
          INTEGER,SAVE,ALLOCATABLE,DIMENSION(:) :: ITVMDDFTR
          REAL,SAVE :: TVMLOGBASEHK,TVMLOGBASEHKINV
          REAL,SAVE :: TVMLOGBASEVKA,TVMLOGBASEVKAINV
          REAL,SAVE :: TVMLOGBASESS,TVMLOGBASESSINV
          REAL,SAVE :: TVMLOGBASESY,TVMLOGBASESYINV
          REAL,SAVE :: TVMLOGBASEPOR,TVMLOGBASEPORINV
          REAL,SAVE :: TVMDDFTR,TVMDDFTRINV
          REAL,SAVE,ALLOCATABLE,DIMENSION(:) :: HKNEWA,VKANEWA
          REAL,SAVE,ALLOCATABLE,DIMENSION(:) :: HKNEWB,VKANEWB
          REAL,SAVE,ALLOCATABLE,DIMENSION(:) :: SSNEWA,SYNEWA
          REAL,SAVE,ALLOCATABLE,DIMENSION(:) :: SSNEWB,SYNEWB
          REAL,SAVE,ALLOCATABLE,DIMENSION(:) :: SSOLD,SYOLD
          REAL,SAVE,ALLOCATABLE,DIMENSION(:) :: PORNEWA
          REAL,SAVE,ALLOCATABLE,DIMENSION(:) :: PORNEWB
          REAL,SAVE,ALLOCATABLE,DIMENSION(:) :: POROLD
          REAL,SAVE,ALLOCATABLE,DIMENSION(:) :: DDFTRNEWA,DDFTRNEWB
          INTEGER,SAVE,ALLOCATABLE,DIMENSION(:) :: ITVMSMAPSS
          INTEGER,SAVE,ALLOCATABLE,DIMENSION(:) :: ITVMSMAPSY
          INTEGER,SAVE,ALLOCATABLE,DIMENSION(:) :: ITVMSMAPPOR
          DOUBLE PRECISION,SAVE,ALLOCATABLE,DIMENSION(:) :: INITPGF
      END MODULE
C
C -------------------------------------------------------------------------------------      
      MODULE GWTBCTMODULE
       INTEGER,SAVE ::IBCTCB,MCOMP,ITVD,IADSORB,ICT,NTITER,IDISP,
     *   IXDISP,IZOD,IFOD,IHEAT,MCOMPT,NTCOMP,IDISPCLN,IMULTI,NSEQITR,
     *   ISOLUBILITY,IAW_ADSORB
       REAL, SAVE    ::CINACT
       DOUBLE PRECISION, SAVE ::CICLOSE
       REAL, SAVE ::DIFFNC
       INTEGER, SAVE, DIMENSION(:,:), ALLOCATABLE ::  LrcC
       INTEGER,    SAVE, DIMENSION(:), ALLOCATABLE     ::IPCBFLAG
       DOUBLE PRECISION, SAVE, DIMENSION(:), ALLOCATABLE :: Cncg
       INTEGER, SAVE,  ALLOCATABLE,   DIMENSION(:)     ::ICBUND
       REAL, SAVE,     ALLOCATABLE,   DIMENSION(:) ::PRSITY
       DOUBLE PRECISION, SAVE,     ALLOCATABLE,   DIMENSION(:) ::MASSBCT
       REAL, SAVE, ALLOCATABLE,   DIMENSION(:,:) ::ADSORB,FLICH,
     1  ZODRW,FODRW,ZODRS,FODRS
       REAL, SAVE, ALLOCATABLE,   DIMENSION(:,:) ::VELNOD
       REAL, SAVE,     ALLOCATABLE,   DIMENSION(:) :: VXL, VYL       
       REAL, SAVE, ALLOCATABLE,  DIMENSION(:) :: DLX,DLY,DLZ,
     1   ATXY,ATYZ,ATXZ
       REAL, SAVE, ALLOCATABLE,  DIMENSION(:) :: ALXY,ALYZ,ALXZ
       DOUBLE PRECISION, SAVE,  ALLOCATABLE,DIMENSION(:,:) ::CONC,CONCO
       REAL*8, SAVE,     ALLOCATABLE,   DIMENSION(:) ::CBCF
       REAL, SAVE,     ALLOCATABLE,   DIMENSION(:) ::CBCH
       DOUBLE PRECISION,    SAVE, DIMENSION(:,:,:), ALLOCATABLE ::VBVLT
       CHARACTER(LEN=16), SAVE, DIMENSION(:,:),   ALLOCATABLE ::VBNMT
       INTEGER, SAVE  ::MSUMT
       INTEGER, SAVE, DIMENSION(:), ALLOCATABLE ::  FLrcC
       DOUBLE PRECISION, SAVE, DIMENSION(:), ALLOCATABLE :: FCncg
       DOUBLE PRECISION, SAVE, DIMENSION(:), ALLOCATABLE :: ADMAT
       REAL, SAVE,     ALLOCATABLE,   DIMENSION(:) ::DXCS,DYCS,DZCS
       REAL, SAVE,     ALLOCATABLE,   DIMENSION(:) ::  DCXL,DCYL
       INTEGER,           SAVE, DIMENSION(:),  ALLOCATABLE ::NODETIBC
       INTEGER :: NICB1
       DOUBLE PRECISION, SAVE, DIMENSION(:,:),ALLOCATABLE  ::CTIB
       REAL, SAVE :: HTCONDW, RHOW, HTCAPW 
       REAL, SAVE, ALLOCATABLE, DIMENSION(:) :: HTCONDM, HTCONDS,HTCONDT
       CHARACTER (LEN=200), SAVE :: CROOTNAME
       DOUBLE PRECISION, SAVE :: TIMEWEIGHT
       INTEGER, SAVE :: ICHAIN,ISPRCT,ISATADSORB
       INTEGER, SAVE,  ALLOCATABLE,   DIMENSION(:) :: NPARENT
       INTEGER, SAVE,  ALLOCATABLE,   DIMENSION(:,:) :: JPARENT
       REAL, SAVE, ALLOCATABLE, DIMENSION (:,:) :: STOTIO
       REAL, SAVE, ALLOCATABLE, DIMENSION (:,:,:) :: SPTLRCT
       REAL, SAVE, ALLOCATABLE,   DIMENSION(:) :: SOLLIM, SOLSLOPE
      END MODULE GWTBCTMODULE
C
C------------------------------------------------------------------------------      
            MODULE GWTDPTMODULE
        INTEGER,SAVE ::IDPTCB,IDPTCON,IC_IBNDIN_FLG,IADSORBIM,
     *  IDISPIM,IZODIM,IFODIM,IAW_ADSORBIM
        INTEGER, SAVE, ALLOCATABLE, DIMENSION (:) :: ICBUNDIM
        REAL, SAVE, ALLOCATABLE, DIMENSION(:) ::DDTTR
C
        DOUBLE PRECISION,SAVE,ALLOCATABLE,DIMENSION(:,:) :: CONCIM
        DOUBLE PRECISION,SAVE,ALLOCATABLE,DIMENSION(:,:) :: CONCOIM
        REAL, SAVE,ALLOCATABLE,DIMENSION(:) :: PRSITYIM,BULKDIM,DLIM
       REAL, SAVE, ALLOCATABLE,   DIMENSION(:,:) ::ADSORBIM,FLICHIM,
     1  ZODRWIM,FODRWIM,ZODRSIM,FODRSIM
       REAL, SAVE, ALLOCATABLE, DIMENSION (:,:,:) :: SPTLRCTIM
        DOUBLE PRECISION, SAVE,ALLOCATABLE,DIMENSION(:) :: MASSBCTIM
        DOUBLE PRECISION, SAVE,ALLOCATABLE,DIMENSION(:) :: DIADDT,RDDT
        DOUBLE PRECISION, SAVE,ALLOCATABLE,DIMENSION(:) :: OFFDDTM
        DOUBLE PRECISION, SAVE,ALLOCATABLE,DIMENSION(:) :: OFFDDTIM
      END MODULE GWTDPTMODULE
C 
C----------------------------------------------------------------------------------    
      MODULE AW_ADSORBMODULE
       INTEGER,SAVE :: IAREA_FN,IKAWI_FN,ITAB_AWI,NAZONES,
     1    NATABROWS
       INTEGER, SAVE, ALLOCATABLE, DIMENSION(:) :: IAWIZONMAP
       REAL, SAVE :: ROG_SIGMA,SIGMA_RT 
       REAL, SAVE, ALLOCATABLE, DIMENSION(:) :: AWAMAX,
     1   AWAREA_X2,AWAREA_X1,AWAREA_X0,AREA_AWI,AREA_AWIO
       REAL, SAVE, ALLOCATABLE, DIMENSION(:,:) :: ALANGAW,BLANGAW,AK_AWI
       REAL, SAVE, ALLOCATABLE, DIMENSION(:,:,:) :: AWI_AREA_TAB
       REAL, SAVE, ALLOCATABLE, DIMENSION(:,:,:,:) :: AWI_KAWI_TAB
      END MODULE
C 
C----------------------------------------------------------------------------------      
      MODULE AW_ADSORBIMMODULE
       INTEGER,SAVE :: IAREA_FNIM,IKAWI_FNIM,ITAB_AWIIM,
     1   NAZONESIM, NATABROWSIM
       INTEGER, SAVE, ALLOCATABLE, DIMENSION(:) :: IAWIZONMAPIM 
       REAL, SAVE :: SIGMA_RTIM,ROG_SIGMAIM
       REAL, SAVE, ALLOCATABLE, DIMENSION(:) :: AWAMAXIM,
     1   AWAREA_X2IM,AWAREA_X1IM,AWAREA_X0IM,AREA_AWIIM,AREA_AWIIMO
       REAL, SAVE, ALLOCATABLE, DIMENSION(:,:) :: ALANGAWIM,BLANGAWIM,
     1    AK_AWIIM       
       REAL, SAVE, ALLOCATABLE, DIMENSION(:,:,:) :: AWI_AREA_TABIM
       REAL, SAVE, ALLOCATABLE, DIMENSION(:,:,:,:) :: AWI_KAWI_TABIM
      END MODULE
C 
C-------------------------------------------------------------------------------------        
      
      
      MODULE GWFWELMODULE
        INTEGER,SAVE,POINTER ::NWELLS,MXWELL,NWELVL,IWELCB,IPRWEL,IAFR
        INTEGER,SAVE,POINTER  ::NPWEL,IWELPB,NNPWEL,IWELQV,NNPWCLN,
     1    IWELLBOT,NAUXWEL
        CHARACTER(LEN=16),SAVE, DIMENSION(:),   ALLOCATABLE     ::WELAUX
        REAL,             SAVE, DIMENSION(:,:), ALLOCATABLE     ::WELL
        DOUBLE PRECISION, SAVE, DIMENSION(:,:), ALLOCATABLE :: WELLBOT
      END MODULE GWFWELMODULE

      
      MODULE GWFCHDMODULE
        INTEGER,SAVE,POINTER  ::NCHDS,MXCHD,NCHDVL,IPRCHD
        INTEGER,SAVE,POINTER  ::NPCHD,ICHDPB,NNPCHD
        CHARACTER(LEN=16),SAVE, DIMENSION(:),   ALLOCATABLE     ::CHDAUX
        REAL,             SAVE, DIMENSION(:,:), ALLOCATABLE     ::CHDS
      END MODULE
      
      MODULE GWFRCHMODULE
        INTEGER, SAVE, POINTER                 ::NRCHOP,IRCHCB,MXNDRCH
        INTEGER,SAVE, POINTER ::NPRCH,IRCHPF,INIRCH,NIRCH,mxznrch,ISELEV
        INTEGER, SAVE,POINTER::IPONDOPT,IRTSOPT,IRTSRD,INRTS,ICONCRCHOPT
        REAL,    SAVE,   DIMENSION(:),  ALLOCATABLE ::RECH,SELEV,RECHSV
        INTEGER, SAVE,   DIMENSION(:),  ALLOCATABLE ::IRCH,iznrch
        REAL,    SAVE,   DIMENSION(:),  ALLOCATABLE ::rtsrch
        REAL,    SAVE,   DIMENSION(:),  ALLOCATABLE      ::RCHF
        REAL,    SAVE,   DIMENSION(:,:),  ALLOCATABLE      ::RCHCONC  !DIMENSION NEQS,NCONCRCH
        INTEGER, SAVE,   DIMENSION(:),  ALLOCATABLE ::IRCHCONC     !DIMENSION MCOMP
        DOUBLE PRECISION, SAVE, POINTER :: tstartrch,tendrch,factrrch,
     1        TIMRCH
       END MODULE GWFRCHMODULE

      MODULE GNCnMODULE
        INTEGER, POINTER::MXGNCn,NGNCn,IPRGNCn,NGNCNPn,NPGNCn,IGNCPBn,
     1                    I2Kn,ISYMGNCn,MXADJn,IFLALPHAn
        REAL,    DIMENSION(:,:), ALLOCATABLE   ::GNCn,SATCn
        INTEGER, DIMENSION (:), ALLOCATABLE :: LGNCn
        INTEGER, DIMENSION (:,:,:),  ALLOCATABLE :: IRGNCn
      END MODULE GNCnMODULE
      
        MODULE XMDMODULE
      IMPLICIT NONE
      LOGICAL, SAVE, POINTER ::  REDSYS
      LOGICAL, SAVE, POINTER :: ILUREUSE
      DOUBLE PRECISION, SAVE, POINTER ::  EPSRN,RRCTOL
      DOUBLE PRECISION, SAVE, DIMENSION(:),ALLOCATABLE::DGSCAL
      INTEGER, SAVE, DIMENSION(:), ALLOCATABLE ::  LORDER
      INTEGER, SAVE, POINTER :: IACL,NORDER,LEVEL,NORTH,
     *  IDROPTOL,IERR,IDSCALE
      END MODULE XMDMODULE
      
            MODULE PCGUMODULE
        INTEGER,SAVE,POINTER  :: ILINMETH
        PRIVATE
        PUBLIC :: PCGU7U1AR
        PUBLIC :: PCGU7U1AP
        PUBLIC :: PCGU7U1DA
        PUBLIC :: PCGUSETDIMS
        PUBLIC :: ILINMETH
        INTEGER,SAVE,POINTER  :: ITER1C,IPC,ISCL,IORD,NITERC,NNZC,NIAC
        INTEGER,SAVE,POINTER  :: NIABCGS
        INTEGER,SAVE,POINTER  :: NIAPC,NJAPC,NNZAPC
        REAL   ,SAVE,POINTER  :: HCLOSEPCGU,RCLOSEPCGU
        REAL   ,SAVE,POINTER  :: RELAXPCGU
        DOUBLE PRECISION, SAVE, POINTER, DIMENSION(:)     :: DSCALE
        DOUBLE PRECISION, SAVE, POINTER, DIMENSION(:)     :: DSCALE2
        INTEGER,          SAVE, POINTER, DIMENSION(:)     :: IAPC
        INTEGER,          SAVE, POINTER, DIMENSION(:)     :: JAPC
        DOUBLE PRECISION, SAVE, POINTER, DIMENSION(:)     :: APC
        INTEGER,          SAVE, POINTER, DIMENSION(:)     :: LORDER
        INTEGER,          SAVE, POINTER, DIMENSION(:)     :: IORDER
        INTEGER,          SAVE, POINTER, DIMENSION(:)     :: IARO
        INTEGER,          SAVE, POINTER, DIMENSION(:)     :: JARO
        DOUBLE PRECISION, SAVE, POINTER, DIMENSION(:)     :: ARO
C         WORKING ARRAYS        
        INTEGER,         SAVE, POINTER, DIMENSION(:)      :: IWC
        DOUBLE PRECISION, SAVE, POINTER, DIMENSION(:)     :: WC
        INTEGER,         SAVE, POINTER, DIMENSION(:)      :: ID
        DOUBLE PRECISION, SAVE, POINTER, DIMENSION(:)     :: XC
        DOUBLEPRECISION, SAVE, POINTER, DIMENSION(:)      :: DC
        DOUBLEPRECISION, SAVE, POINTER, DIMENSION(:)      :: PC
        DOUBLEPRECISION, SAVE, POINTER, DIMENSION(:)      :: QC
        DOUBLEPRECISION, SAVE, POINTER, DIMENSION(:)      :: ZC
C         BICGSTAB WORKING ARRAYS
        DOUBLEPRECISION, SAVE, POINTER, DIMENSION(:)      :: TC
        DOUBLEPRECISION, SAVE, POINTER, DIMENSION(:)      :: VC
        DOUBLEPRECISION, SAVE, POINTER, DIMENSION(:)      :: DHATC
        DOUBLEPRECISION, SAVE, POINTER, DIMENSION(:)      :: PHATC
        DOUBLEPRECISION, SAVE, POINTER, DIMENSION(:)      :: QHATC
C         POINTERS FOR USE WITH BOTH ORIGINAL AND RCM ORDERINGS
        INTEGER,          SAVE, POINTER, DIMENSION(:)     :: IA0
        INTEGER,          SAVE, POINTER, DIMENSION(:)     :: JA0
        DOUBLE PRECISION, SAVE, POINTER, DIMENSION(:)     :: A0
        
      TYPE PCGUTYPE
        INTEGER,POINTER  :: ILINMETH
        INTEGER,POINTER  :: ITER1C,IPC,ISCL,IORD,NITERC,NNZC,NIAC
        INTEGER,POINTER  :: NIABCGS
        INTEGER,POINTER  :: NIAPC,NJAPC,NNZAPC
        REAL   ,POINTER  :: HCLOSEPCGU,RCLOSEPCGU
        REAL   ,POINTER  :: RELAXPCGU
        DOUBLE PRECISION, POINTER, DIMENSION(:)     :: DSCALE
        DOUBLE PRECISION, POINTER, DIMENSION(:)     :: DSCALE2
        INTEGER,          POINTER, DIMENSION(:)     :: IAPC
        INTEGER,          POINTER, DIMENSION(:)     :: JAPC
        DOUBLE PRECISION, POINTER, DIMENSION(:)     :: APC
        INTEGER,          POINTER, DIMENSION(:)     :: LORDER
        INTEGER,          POINTER, DIMENSION(:)     :: IORDER
        INTEGER,          POINTER, DIMENSION(:)     :: IARO
        INTEGER,          POINTER, DIMENSION(:)     :: JARO
        DOUBLE PRECISION, POINTER, DIMENSION(:)     :: ARO
C         WORKING ARRAYS        
        INTEGER,         POINTER, DIMENSION(:)      :: IWC
        DOUBLE PRECISION, POINTER, DIMENSION(:)     :: WC
        INTEGER,         POINTER, DIMENSION(:)      :: ID
        DOUBLE PRECISION, POINTER, DIMENSION(:)     :: XC
        DOUBLEPRECISION, POINTER, DIMENSION(:)      :: DC
        DOUBLEPRECISION, POINTER, DIMENSION(:)      :: PC
        DOUBLEPRECISION, POINTER, DIMENSION(:)      :: QC
        DOUBLEPRECISION, POINTER, DIMENSION(:)      :: ZC
C         BICGSTAB WORKING ARRAYS
        DOUBLEPRECISION, POINTER, DIMENSION(:)      :: TC
        DOUBLEPRECISION, POINTER, DIMENSION(:)      :: VC
        DOUBLEPRECISION, POINTER, DIMENSION(:)      :: DHATC
        DOUBLEPRECISION, POINTER, DIMENSION(:)      :: PHATC
        DOUBLEPRECISION, POINTER, DIMENSION(:)      :: QHATC
C         POINTERS FOR USE WITH BOTH ORIGINAL, RCM, AND MINIMUM DEGREE ORDERINGS
        INTEGER,          POINTER, DIMENSION(:)     :: IA0
        INTEGER,          POINTER, DIMENSION(:)     :: JA0
        DOUBLE PRECISION, POINTER, DIMENSION(:)     :: A0
      END TYPE
      TYPE(PCGUTYPE), SAVE ::PCGUDAT(10)
      end MODULE PCGUMODULE


      MODULE SWFBCMODULE
        INTEGER,SAVE,POINTER  ::NSWBC,NCRD,NZDG,NVSWBC,ISWBCCB    !NDRAIN,MXDRN,NDRNVL,IDRNCB,IPRDRN
        INTEGER,SAVE, DIMENSION(:), ALLOCATABLE     :: ISWBC
        REAL*8, SAVE, DIMENSION(:,:), ALLOCATABLE     :: VSWBC
        REAL*8, SAVE, DIMENSION(:), ALLOCATABLE     :: QSWBC
        
        REAL*8 :: GRAV_SWF
      END MODULE SWFBCMODULE
