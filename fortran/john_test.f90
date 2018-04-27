Module sp_hnfs
  implicit none
  integer, parameter:: dp=selected_real_kind(15,307)
  integer, parameter:: sp=selected_real_kind(6,37)
  integer, parameter:: si=selected_int_kind(1) ! very short integer -10..10 range
  integer, parameter:: li=selected_int_kind(18) ! Big integer -10^18..10^18 range
CONTAINS
  SUBROUTINE fco_16(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp) :: gamma11, gamma12, gamma21
    real(dp), allocatable :: bs(:)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in fco_16."

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if (MOD(c,2.0_dp)==0) then
          allocate(bs(2))
          bs = (/real(int(c)/2,dp),0.0_dp/)
       else
          allocate(bs(1))
          bs = (/0.0_dp/)
       end if
       do j=1, size(bs)
         do k=0, int(f-1)
           b = bs(j)
           e = real(k,dp)
           gamma11 = -b-2*b*e/c
           gamma21 = c+2*e
           if(MOD(gamma11,f)==0 .and. MOD(gamma21,f)==0)then
             do z=0,int(f-1)
               d = real(z,dp)
               gamma12 = a+2*d-(2*b*e/c)
               if(MOD(gamma12,f)==0)then
                 nhnfs = nhnfs + 1
                 temp_HNFs(:,:,nhnfs) = reshape((/ int(a), int(b), int(d), &
                    0, int(c), int(e), &
                    0, 0, int(f)/),(/3,3/))
               end if
             end do
           end if
       end do
    end do
    deallocate(bs)
  end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE fco_16


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

  SUBROUTINE rhom_4_2(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp) :: beta32,beta22,gamma11,gamma21,beta12,gamma12,gamma22
    real(dp), allocatable :: bs(:)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in rhom_4_2."

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if (MOD(c,2.0_dp)==0) then
          allocate(bs(2))
          bs = (/0.0_dp,real(int(c)/2,dp)/)
       else
          allocate(bs(1))
          bs = (/0.0_dp/)
       end if
       do j=1, size(bs)

           beta32 = -f+b*f/a
           if(MOD(beta32,c)==0) then
             do k=0, int(f-1)
               e = real(k)
               beta22 = -e+b*e/a
               gamma11 = b-2.0_dp*b*e/c
               gamma21 = c-2.0_dp*e
               if((MOD(e,a)==0) .and. (MOD(beta22,c)==0) .and. (MOD(gamma11,f)==0) &
                 .and. (MOD(gamma21,f)==0))then
                  do z=0,int(f-1)
                    d = real(z)
                    beta12 = -a+b-d+b*d/a
                    gamma12 = (-a+d*d/a)-(e*beta12/c)
                    gamma22 = (-e+d*e/a)-(e*beta22/c)
                    if((MOD(d,a)==0) .and. (MOD(beta12,c)==0) .and. (MOD(gamma12,f)==0) &
                      .and. (MOD(gamma22,f)==0))then
                      nhnfs = nhnfs + 1
                      temp_HNFs(:,:,nhnfs) = reshape((/ int(a), int(b), int(d), &
                         0, int(c), int(e), &
                         0, 0, int(f)/),(/3,3/))
                    end if
                  end do
                end if
              end do
            end if
          end do
       deallocate(bs)
     end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  END SUBROUTINE rhom_4_2

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

program test
use sp_hnfs
  integer :: n = 10, arrSize,i = 1
  integer, allocatable :: spHNFs(:,:,:)

  call fco_16(n,spHNFs)
  arrSize = size(spHNFs,3)
  open (unit = 1, file = 'fort_spHNFs.txt', form='formatted')
  write(*,*), arrSize
  do i = 1,arrSize
    write(1,*), spHNFs(1:3,1,i)
    write(1,*), spHNFs(1:3,2,i)
    write(1,*), spHNFs(1:3,3,i)
  enddo
  close(1)

END program test
