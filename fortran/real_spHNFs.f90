Module sp_hnfs
  implicit none
  integer, parameter:: dp=selected_real_kind(15,307)
  integer, parameter:: sp=selected_real_kind(6,37)
  integer, parameter:: si=selected_int_kind(1) ! very short integer -10..10 range
  integer, parameter:: li=selected_int_kind(18) ! Big integer -10^18..10^18 range
CONTAINS
  SUBROUTINE bct_6_7_15_18(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp) :: gamma21,gamma13,beta12,gamma12
    real(dp), allocatable :: es(:)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in bct_6_7_15_18."

    do i =1,nds
      a = diagonals(1,i)
      c = diagonals(2,i)
      f = diagonals(3,i)

      if (MOD(f,c)==0)then
        if (MOD(f,2.0_dp)==0)then
           allocate(es(2))
           es = (/0.0_dp,real(int(f)/2,dp)/)
        else
           allocate(es(1))
           es = (/0.0_dp/)
        end if
        do j=1,size(es)
          e = es(j)
          if(MOD(e,c)==0)then
            gamma21 = -c+e*e/c
            if(MOD(gamma21,f)==0)then
              do k=0,int(f-1)
                d = real(k)
                gamma13 = a+2*d
                if(MOD(gamma13,f)==0)then
                  do z=0,int(c-1)
                    b = real(z)
                    beta12 = b-d
                    if(MOD(beta12,c)==0)then
                      gamma12 = -b+d-(beta12*e/c)
                      if(MOD(gamma12,f)==0)then
                        nhnfs = nhnfs + 1
                        temp_HNFs(:,:,nhnfs) = reshape((/ int(a), int(b), int(d), &
                           0, int(c), int(e), &
                           0, 0, int(f)/),(/3,3/))
                      end if
                    end if
                  end do
                end if
              end do
            end if
          end if
        end do
      deallocate(es)
      endif
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE bct_6_7_15_18

  SUBROUTINE basecm_10_14_17_27_37_39_41(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp) :: gamma11
    real(dp), allocatable :: es(:)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in basecm_14."

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if (MOD(f,2.0_dp)==0) then
          allocate(es(2))
          es = (/0.0_dp,real(int(f)/2,dp)/)
       else
          allocate(es(1))
          es = (/0.0_dp/)
       end if

       do j=1,size(es)
         do k=0,int(f-1)
           e = es(j)
           d = real(k,dp)
           gamma11 = -1*a + 2.0_dp*d
           if (MOD(gamma11,f)==0) then
             do z=0,int(c-1)
               b = real(z,dp)
               nhnfs = nhnfs + 1
               temp_HNFs(:,:,nhnfs) = reshape((/ int(a), int(b), int(d), &
               0, int(c), int(e), &
               0, 0, int(f)/),(/3,3/))
             end do
            end if
          end do
        end do
       deallocate(es)
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE basecm_10_14_17_27_37_39_41

  SUBROUTINE get_HNF_diagonals(detS, diagonals)
    integer, intent(in) :: detS
    integer, pointer :: diagonals(:,:)

    integer i, j, id, quotient, status
    integer :: tempDiag(3,detS*3)

    id = 0 ! Number of diagonals found
    do i = 1,detS ! Loop over possible first factors
       if (.not. mod(detS,i)==0) cycle
       quotient = detS/i
       do j = 1,quotient  ! Loop over possible second/third factors
          if (.not. mod(quotient,j)==0) cycle
          id = id + 1
          tempDiag(:,id) = (/i, j, quotient/j /) ! Construct the factor triplet
       enddo
    enddo
    allocate(diagonals(3,id),STAT=status)
    if(status/=0) stop "Allocation failed in get_HNF_diagonals"
    diagonals = tempDiag(:,1:id)
  END SUBROUTINE get_HNF_diagonals
END Module sp_hnfs

program real_spHNFs
use sp_hnfs
  integer :: n = 9999, arrSize,i = 1
  integer, allocatable :: spHNFs(:,:,:)

  call bct_6_7_15_18(n,spHNFs)
  arrSize = size(spHNFs,3)
  open (unit = 1, file = 'real_sphnfs.txt', form='formatted')
  write(*,*), arrSize
  do i = 1,arrSize
    write(1,*), spHNFs(1:3,1,i)
    write(1,*), spHNFs(1:3,2,i)
    write(1,*), spHNFs(1:3,3,i)
  enddo
  close(1)

END program real_spHNFs
