Module Materials
    use GeneralRoutines
    implicit none

        integer :: nGWFMaterials
        integer,allocatable :: GWFMaterialID(:)
        character*256, allocatable :: GWFMaterialName(:)
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
        
        integer :: nSWFMaterials
        integer,allocatable :: SWFMaterialID(:)
        character*256, allocatable :: SWFMaterialName(:)
        real, allocatable :: ManningCoefficient(:)
        real, allocatable :: DepressionStorageHeight(:)
        real, allocatable :: ObstructionStorageHeight(:)
        real, allocatable :: SWF_GWF_ConnectionLength(:)

        integer :: nET
        integer,allocatable :: ET_ID(:)
        character*256, allocatable :: ET_Name(:)
        real, allocatable :: EvaporationDepth(:)
        real, allocatable :: RootDepth(:)
        character*256, allocatable :: LAI_Table(:)
        real, allocatable :: C1(:)
        real, allocatable :: C2(:)
        real, allocatable :: C3(:)
        real, allocatable :: WiltingPoint(:)
        real, allocatable :: FieldCapacity(:)
        real, allocatable :: OxicLimit(:)
        real, allocatable :: AnoxicLimit(:)
        real, allocatable :: EvaporationMinimum(:)
        real, allocatable :: EvaporationMaximum(:)
        real, allocatable :: CanopyStorageParameter(:)
        real, allocatable :: InitialInterceptionStorage(:)
   
    contains
    
    !----------------------------------------------------------------------
    subroutine DB_ReadGWFMaterials(FName)
        implicit none

        
        integer :: i

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
        
        nGWFMaterials=i
        
        allocate(GWFMaterialID(nGWFMaterials), GWFMaterialName(nGWFMaterials), Porosity(nGWFMaterials), Kh_Kx(nGWFMaterials), Kv_Kz(nGWFMaterials), Ky(nGWFMaterials), &
            Specificstorage(nGWFMaterials), SpecificYield(nGWFMaterials), Brooks_Corey(nGWFMaterials), Alpha(nGWFMaterials), Beta(nGWFMaterials), Sr(nGWFMaterials), &
            Tabular_Input(nGWFMaterials), PSTable(nGWFMaterials), SKrTable(nGWFMaterials), stat=ialloc)
        call AllocChk(ialloc,'GWF material database arrays')

        rewind(itmp)
        read(itmp,'(a)') line
        do i=1,nGWFMaterials
	        read(itmp,*,iostat=status) GWFMaterialID(i), GWFMaterialName(i), Porosity(i), Kh_Kx(i), Kv_Kz(i), Ky(i), Specificstorage(i), SpecificYield(i), &
                Brooks_Corey(i), Alpha(i), Beta(i), Sr(i), Tabular_Input(i), PSTable(i), SKrTable(i)
        end do
        
        call freeunit(itmp)

    end subroutine DB_ReadGWFMaterials
    
    !----------------------------------------------------------------------
    subroutine DB_ReadSWFMaterials(FName)
        implicit none

        
        integer :: i

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
        
        nSWFMaterials=i
        
        allocate(SWFMaterialID(nSWFMaterials), SWFMaterialName(nSWFMaterials), ManningCoefficient(nSWFMaterials), DepressionStorageHeight(nSWFMaterials),&
            ObstructionStorageHeight(nSWFMaterials), SWF_GWF_ConnectionLength(nSWFMaterials), stat=ialloc)
        call AllocChk(ialloc,'SWF material database arrays')

        rewind(itmp)
        read(itmp,'(a)') line
        do i=1,nSWFMaterials
	        read(itmp,*,iostat=status) SWFMaterialID(i), SWFMaterialName(i), ManningCoefficient(i), DepressionStorageHeight(i),&
            ObstructionStorageHeight(i), SWF_GWF_ConnectionLength(i)
        end do
        
        call freeunit(itmp)

    end subroutine DB_ReadSWFMaterials
    
        !----------------------------------------------------------------------
    subroutine DB_ReadET(FName)
        implicit none

        
        integer :: i

	    character(*) :: FName
	    character(256) :: line

		call Msg(TAB//TAB//'ET file '//trim(FName))
        call OpenAscii(itmp,FName)
	    
        ! Count materials
        read(itmp,'(a)') line
        i=0
        do
	        read(itmp,*,iostat=status) line
            if(status/=0) exit
            i=i+1        
        end do
        
        nET=i
        
        allocate(ET_ID(nET), ET_Name(nET), EvaporationDepth(nET), RootDepth(nET),  LAI_Table(nET),  C1(nET), C2(nET), C3(nET), &
            WiltingPoint(nET), FieldCapacity(nET), OxicLimit(nET), AnoxicLimit(nET), EvaporationMinimum(nET), EvaporationMaximum(nET), &
            CanopyStorageParameter(nET), InitialInterceptionStorage(nET), stat=ialloc)
        call AllocChk(ialloc,'ET database arrays')

        rewind(itmp)
        read(itmp,'(a)') line
        do i=1,nET
	        read(itmp,*,iostat=status) ET_ID(i), ET_Name(i), EvaporationDepth(i), RootDepth(i),  LAI_Table(i),  C1(i), C2(i), C3(i), &
            WiltingPoint(i), FieldCapacity(i), OxicLimit(i), AnoxicLimit(i), EvaporationMinimum(i), EvaporationMaximum(i), &
            CanopyStorageParameter(i), InitialInterceptionStorage(i)
        end do
        
        call freeunit(itmp)

    end subroutine DB_ReadET

end module Materials
