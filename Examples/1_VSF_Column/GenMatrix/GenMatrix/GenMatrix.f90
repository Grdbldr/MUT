!  GenMatrix.f90 
!
!  FUNCTIONS:
!  GenMatrix - Entry point of console application.
!

!****************************************************************************
!
!  PROGRAM: GenMatrix
!
!  PURPOSE:  Entry point for the console application.
!
!****************************************************************************

    program GenMatrix

    implicit none

    integer :: icolumn,iraw,ilayer
    integer :: ncolumn,nraw,nlayer
    
    real*8 :: topelev,inithead
    real*8 :: x,y
    real*8 :: z0,slope
    
    character*3 :: s3
    

    
    ncolumn=1
    nraw=1
    nlayer=101
    
    open(1004,file='inithead.dat')
    do ilayer=1,nlayer
        inithead =-100.0d0+dble(101-ilayer)
        do iraw=1,nraw
            do icolumn=1,ncolumn
                write(1004,'(f12.6)') inithead
            enddo
        enddo
    enddo
    close(1004)
    
    end program GenMatrix

