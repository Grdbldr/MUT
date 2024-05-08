module MUT  !### Modflow-USG Tools
    use GeneralRoutines
    use MUSG
    use HGS
    use tecplot

    implicit none

    !integer, parameter :: maxnn=1000000,maxne=1000000,maxnef=2000000
    character(60) :: MUT_CMD="none"
    character(60) :: ProcessModflowUSG_CMD="modflow_usg"
    character(60) :: ProcessHGS_CMD="hgs"
    ! TecIO szplt
    character(60) :: ProcessTecplot_CMD="tecplot"
        

    character(256) :: FileNameMUT
    integer :: FnumMUT
    integer :: FnumUserMUT
    character(40)       :: prefix = ''
    integer				:: l_prfx  = 0

    character(MAXLBL) :: DirName ! directory name

    contains

    subroutine Header
        call date_and_time(DateSTR, TIME = TimeSTR, ZONE = TimezoneSTR)
        call Msg( '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ')
        call Msg( '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ')
        call Msg( '@@                                                                      @@ ')
        call Msg( '@@                    MUT         '//MUTVersion//'                                 @@ ')
        call Msg( '@@                    Run date '//DateStr//'                             @@ ')
        call Msg( '@@                                                                      @@ ')
        call Msg( '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ')
        call Msg( '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ')
    end subroutine  header

    subroutine OpenMUT  !--- Modflow user tools  .mut

        write(*,'(a)')  'MUT version '//MUTVersion

        ! open the user MUT input file
        call EnterPrefix(prefix,l_prfx,FnumUserMUT,'mut')
        
        CmdLine=' del '//trim(prefix(:l_prfx))//'o.*'
        CALL execute_command_line(trim(CmdLine))

        ! open a file called prefix.eco, if it exists, overwrite it with MUT header
        FNameEco=prefix(:l_prfx)//'o.eco'
        call openascii(FnumEco,FNameEco)
        call header
        call Msg(' ')
        call Msg (FileReadSTR//'User input file: '//prefix(:l_prfx)//'.mut')
        call Msg(' ')
        call Msg (FileCreateSTR//'Echo file: '//FNameEco)
        ErrFNum=FnumEco


        ! Create one processed input file
        FNameInput=prefix(:l_prfx)//'o.input'
        call openascii(FnumMUT,FNameInput)

        ! strip out blanks and comments and concatenate included files
        call StripComments(FnumUserMUT,FnumMUT)
	    call freeunit(FnumUserMUT)
	    call Msg(' ')
        call Msg (FileCreateSTR//'Stripped input file: '//FNameInput)

    end subroutine OpenMUT



    subroutine ProcessMUT !--- Command processor for Modflow-USG Tools (.mut file extension)

        type (ModflowProject) MyMUSG_Project
        type (HGSProject) MyHGS
        do
            read(FnumMUT,'(a)',iostat=status,end=10) MUT_CMD
            call LwrCse(MUT_CMD)
            call Msg(' ')
            call Msg(MUT_CMD)


            if(status/=0) then
 		        write(ErrStr,'(a)') 'File: a.mut'
		        l1=len_trim(ErrStr)
		        write(ErrStr,'(a)') ErrStr(:l1)//New_line(a)//'Error reading file'
			    call ErrMsg(ErrStr)
           end if

            if(index(MUT_CMD, StopWatch_CMD) /= 0) then
                read(FnumMUT,*) l1
                read(FnumMUT,'(a)') TmpSTR
                call StopWatch(l1,TmpSTR(:len_trim(TmpSTR)))
            else if(index(MUT_CMD, SplitTime_CMD) /= 0) then
                read(FnumMUT,*) l1
                call SplitTime(l1)
            else if(index(MUT_CMD, ElapsedTime_CMD) /= 0) then
                read(FnumMUT,*) l1
                call ElapsedTime(l1)


            else if(index(MUT_CMD, ProcessModflowUSG_CMD) /= 0) then
                call ProcessModflowUSG(FnumMUT,MyMUSG_Project,prefix)


            else if(index(MUT_CMD, ProcessHGS_CMD) /= 0) then
                call ProcessHGS(FnumMUT,MyHGS)

            else if(index(MUT_CMD, ProcessTecplot_CMD) /= 0) then
                call ProcessTecplot(FnumMUT)

            else
                call ErrMsg('MUT?:'//MUT_CMD)
            end if
        end do

        10 continue
    end subroutine ProcessMUT


    subroutine CloseMUT !--- Modflow-USG Tools .mut
       call Msg(' ')
       call Msg('Normal exit')
       call FreeUnit(FnumMUT)
    end subroutine CloseMUT



end module MUT