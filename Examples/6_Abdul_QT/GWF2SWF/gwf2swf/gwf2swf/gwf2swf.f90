    program gwf2swf

    implicit none

    integer :: nn,nlayer,ne,nn2d,ne2d,ilayer,nln,idum,nja
    real*8, allocatable :: xn(:),yn(:),zn(:)
    real*8, allocatable :: xe(:),ye(:),ze(:)
    integer, allocatable :: in(:,:),iprop(:),elayer(:)
    real*8, allocatable :: top(:),bot(:),area(:),cln(:),fahl(:)
    integer, allocatable :: ia(:),ja(:)
    
    integer :: i,j
    real*8 :: x,y,z
    
    nln = 8
    open(1004,file='abdulqt.gwf.gsf')
    read(1004,*)
    read(1004,*) ne,nlayer
    read(1004,*) nn
    allocate(xn(nn),yn(nn),zn(nn))
    do i=1,nn
        read(1004,*) xn(i),yn(i),zn(i)
    enddo
    allocate(xe(ne),ye(ne),ze(ne),in(nln,ne))
    do i=1,ne
        read(1004,*) idum,xe(i),ye(i),ze(i),ilayer,nln,(in(j,i),j=1,nln)
        continue
    enddo
    close(1004)
    
    nn2d = nn/(nlayer+1)
    ne2d = ne/nlayer
    open(1004,file='abdulqt.swf.gsf')
    write(1004,'(a)') 'UNSTRUCTURED'
    write(1004,*) ne2d,1,0,0
    write(1004,*) nn2d
    do i=1,nn2d
        write(1004,*) xn(i),yn(i),zn(i)
    enddo
    
    open(1004,file='top_elevation.dat')
    read(1004,*)
    read(1004,*) (ze(i),i=1,ne2d)
    close(1004)
    
    ilayer=1
    do i=1,ne2d
        x=0.0d0; y=0.0d0; z=0.0d0
        do j=1,nln/2
            x=x+xn(in(j,i))
            y=y+yn(in(j,i))
            z=z+zn(in(j,i))
        enddo
        x=x/4.0d0; y=y/4.0d0; z=z/4.0d0
        write(1004,'(i10,2x,3(1pg15.5),2x,2i10,10i10)') i,x,y,ze(i),ilayer,nln/2,(in(j,i),j=1,nln/2)
    enddo
    close(1004)
    
    allocate(iprop(ne2d))
    open(1004,file='swf_zone_numbers.dat')
    read(1004,*) (iprop(i),i=1,ne2d)
    close(1004)
    continue

    allocate(top(ne2d),bot(ne2d),area(ne2d))
    open(1004,file='abdulqt_onelayer.dis')
    read(1004,*) ne,nlayer,nja
    read(1004,*) 
    read(1004,*) 
    read(1004,*) ne2d
    read(1004,*)
    read(1004,*) (top(i),i=1,ne2d)
    read(1004,*)
    read(1004,*) (bot(i),i=1,ne2d)
    read(1004,*)
    read(1004,*) (area(i),i=1,ne2d)
    read(1004,*)
    allocate(ia(nn2d),ja(nja),cln(nja),fahl(nja))
    read(1004,*) (ia(i),i=1,ne2d)
    read(1004,*)
    read(1004,*) (ja(i),i=1,nja)
    read(1004,*)
    read(1004,*) (cln(i),i=1,nja)
    read(1004,*)
    read(1004,*) (fahl(i),i=1,nja)
    close(1004)
    
    open(1004,file='swftmp.dat')
    do i=1,ne2d
        write(1004,'(2i10,2(1pG15.5),i5)') i,iprop(i),area(i),ze(i),0 
    enddo
    !
    !do i=1,ne2d
    !    write(1004,'(2i10,3x,i5,2(1pG15.5),i5)') i,i,1,1.0d-3,area(i),0
    !enddo
    !
    !do i=1,ne2d
    !    top(i)=ze(i)+1.0e-5
    !enddo
    !write(1004,'(5(1pg15.8))') (top(i),i=1,ne2d)
    close(1004)
    
    end program gwf2swf

