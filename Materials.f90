Module Materials
    use GeneralRoutines
    implicit none

        integer :: nMaterials
        integer,allocatable :: MaterialID(:)
        character*256, allocatable :: MaterialName(:)
        real, allocatable :: Porosity(:)
        real, allocatable :: Kh_Kx(:)
        real, allocatable :: Kv_Kz(:)
        real, allocatable :: Ky(:)
        real, allocatable :: Specificstorage(:)
        real, allocatable :: SpecificYield(:)
        integer, allocatable :: Brooks_Corey(:)
        real, allocatable :: Alpha(:)
        real, allocatable :: Beta(:)
        real, allocatable :: Sr(:)
        integer, allocatable :: Tabular_Input(:)
        character*256, allocatable :: PSTable(:)
        character*256, allocatable :: SKrTable(:)
        character*256, allocatable :: Source(:)
   
    contains
    
    !----------------------------------------------------------------------
    subroutine DB_ReadMaterials(FName)
        implicit none

        
        integer :: i
        integer :: maxnnp

	    character(*) :: FName
	    character(256) :: line

		call Msg(TAB//TAB//'Materials file '//trim(FName))
        call OpenAscii(itmp,FName)
	    
        ! Count materials
        read(itmp,'(a)') line
        i=0
        do
	        read(itmp,*,iostat=status) line
            if(status/=0) exit
            i=i+1        
        end do
        
        nMaterials=i
        
        allocate(MaterialID(nMaterials), MaterialName(nMaterials), Porosity(nMaterials), Kh_Kx(nMaterials), Kv_Kz(nMaterials), Ky(nMaterials), &
            Specificstorage(nMaterials), SpecificYield(nMaterials), Brooks_Corey(nMaterials), Alpha(nMaterials), Beta(nMaterials), Sr(nMaterials), &
            Tabular_Input(nMaterials), PSTable(nMaterials), SKrTable(nMaterials), Source(nMaterials), stat=ialloc)
        call AllocChk(ialloc,'Material database arrays')

        rewind(itmp)
        read(itmp,'(a)') line
        do i=1,nMaterials
	        read(itmp,*,iostat=status) MaterialID(i), MaterialName(i), Porosity(i), Kh_Kx(i), Kv_Kz(i), Ky(i), Specificstorage(i), SpecificYield(i), &
                Brooks_Corey(i), Alpha(i), Beta(i), Sr(i), Tabular_Input(i), PSTable(i), SKrTable(i), Source(i)
            write(*,*) 
	        write(*,*) MaterialID(i), MaterialName(i), Porosity(i), Kh_Kx(i), Kv_Kz(i), Ky(i), Specificstorage(i), SpecificYield(i), &
                Brooks_Corey(i), Alpha(i), Beta(i), Sr(i), Tabular_Input(i), PSTable(i), SKrTable(i), Source(i)
        
        end do
        
        call freeunit(itmp)

    end subroutine DB_ReadMaterials
end module Materials
