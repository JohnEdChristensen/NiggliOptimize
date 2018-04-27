!!<summary>Generates the symmetry preserving HNFs for the different
!!crystal lattices.</summary>
Module int_sp_hnfs
  implicit none
  private
  public sc_3, fcc_1, bcc_5, hex_12, hex_22, rhom_9_24, rhom_4_2, st_11, st_21, &
       bct_6_7_15_18, so_32, baseco_23, baseco_36, baseco_40, baseco_38_13, &
       bco_19, bco_8, bco_42, fco_26, fco_16, sm_33, sm_34_35, basecm_10_14_17_27_37_39_41, &
       basecm_43, basecm_28, basecm_29_30, basecm_20_25, tric_31_44

  integer, parameter:: dp=selected_real_kind(15,307)
  integer, parameter:: sp=selected_real_kind(6,37)
  integer, parameter:: si=selected_int_kind(1) ! very short integer -10..10 range
  integer, parameter:: li=selected_int_kind(18) ! Big integer -10^18..10^18 range


CONTAINS

  !!<summary>Finds the symmetry preserving HNFs for the simple cubic
  !!lattice with determinant n. Assuming the basis of A =
  !![[1,0,0],[0,1,0],[0,0,1]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE sc_3(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    integer :: a,b,c,d,e,f
    integer :: nds, i, nhnfs
    integer :: temp_HNFs(3,3,1)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if ((a==c) .and. (c==f)) then
          b = 0
          d = 0
          e = 0
          nhnfs = nhnfs + 1
          temp_HNFs(:,:,nhnfs) = reshape((/ a, b, d, &
               0, c, e, &
               0, 0, f/),(/3,3/))
          exit
       elseif ((a==c) .and. (real(f,dp)/real(a,dp)==2)) then
          b = 0
          d = a
          e = a
          nhnfs = nhnfs + 1
          temp_HNFs(:,:,nhnfs) = reshape((/ a, b, d, &
               0, c, e, &
               0, 0, f/),(/3,3/))
          exit
       elseif ((c==f) .and. (real(f,dp)/real(a,dp)==2)) then
          b = a
          d = a
          e = 0
          nhnfs = nhnfs + 1
          temp_HNFs(:,:,nhnfs) = reshape((/ a, b, d, &
               0, c, e, &
               0, 0, f/),(/3,3/))
          exit
       end if
    end do
    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE sc_3

  !!<summary>Finds the symmetry preserving HNFs for the face centered
  !!cubic lattice with determinant n. Assuming the basis of A =
  !![[0,1,1],[1,0,1],[1,1,0]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE fcc_1(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    integer :: a,b,c,d,e,f
    integer :: nds, i, nhnfs
    integer :: temp_HNFs(3,3,1)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if ((a==c) .and. (a==f)) then
          b = 0
          d = 0
          e = 0
          nhnfs = nhnfs + 1
          temp_HNFs(:,:,nhnfs) = reshape((/ a, b, d, &
               0, c, e, &
               0, 0, f/),(/3,3/))
          exit
       elseif ((c==f) .and. ((real(f,dp)/real(a,dp) == 2) .or. (real(f,dp)/real(a,dp) == 4))) then
          b = a
          d = a
          e = 0
          nhnfs = nhnfs + 1
          temp_HNFs(:,:,nhnfs) = reshape((/ a, b, d, &
               0, c, e, &
               0, 0, f/),(/3,3/))
          exit
       end if
    end do
    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE fcc_1

  !!<summary>Finds the symmetry preserving HNFs for the body centered
  !!cubic lattice with determinant n. Assuming the basis of A =
  !![[-1,1,1],[1,-1,1],[1,1,-1]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE bcc_5(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    integer :: a,b,c,d,e,f
    integer :: nds, i, nhnfs
    integer :: temp_HNFs(3,3,1)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if ((a==c) .and. (a==f)) then
          b = 0
          d = 0
          e = 0
          nhnfs = nhnfs + 1
          temp_HNFs(:,:,nhnfs) = reshape((/ a, b, d, &
               0, c, e, &
               0, 0, f/),(/3,3/))
          exit
       elseif ((a==c) .and. (real(f,dp)/real(a,dp)==2)) then
          b = 0
          d = a
          e = a
          nhnfs = nhnfs + 1
          temp_HNFs(:,:,nhnfs) = reshape((/ a, b, d, &
               0, c, e, &
               0, 0, f/),(/3,3/))
          exit
       elseif ((a==c) .and. (real(f,dp)/real(a,dp) ==4)) then
          b = 0
          d = 3*a
          e = 3*a
          nhnfs = nhnfs + 1
          temp_HNFs(:,:,nhnfs) = reshape((/ a, b, d, &
               0, c, e, &
               0, 0, f/),(/3,3/))
          exit
       end if
    end do
    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE bcc_5

  !!<summary>Finds the symmetry preserving HNFs for the hexagonal
  !!lattice with determinant n. Assuming the basis of A =
  !![[1,0,0],[0.5,-0.8660254037844386,0],[0,0,2]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE hex_12(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    integer :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j,k
    integer(li) :: total_hnfs
    integer(si) :: nes
    integer, allocatable :: temp_HNFs(:,:,:)

    integer :: beta13, beta11, gamma13, gamma11, gamma12, gamma21, gamma22
    integer :: es(2)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in hex_12."

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if (MOD(c,a) ==0) then
          b = 0
          do while (b < c)
             beta13 = a+2*b
             if(MOD(b*b,a) == 0)then
               beta11 = 2*b+b*b/a
               if ((MOD(beta13,c)==0) .and. (MOD(beta11,c)==0)) then
                  if (MOD(f,2)==0) then
                     nes = 2
                     es = (/0,f/2/)
                  else
                     nes = 1
                     es = (/0,-1/)
                  end if
                  do j = 1,nes
                     e = es(j)
                     gamma13 = (a+2*b)*e
                     if(MOD(gamma13,c)==0 .and. MOD(gamma13/c,f)==0) then
                        do d=0,f-1
                          if(MOD(b*d,a)==0 .and. MOD(e*beta11,c)==0 .and. MOD(b*e,a)==0) then
                           gamma11 = b*d/a - e*beta11/c
                           gamma12 = 2*d + b*d/a - e*beta11/c
                           gamma21 = d - 2*e - b*e/a !cd/c
                           gamma22 = (c*d - b*e)
                           if ((MOD(gamma11,f)==0) .and. (MOD(gamma12,f)==0) .and. &
                            (MOD(gamma21,f)==0) .and. (MOD(gamma22,a) ==0) .and. (MOD(gamma22/a,f) ==0)) then
                              nhnfs = nhnfs + 1
                              temp_HNFs(:,:,nhnfs) = reshape((/ a, b, d, &
                                   0, c, e, &
                                   0, 0, f/),(/3,3/))
                           end if
                         end if
                        end do
                     end if
                  end do
               end if
               b = b + a
             end if
          end do
       end if
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE hex_12

  !!<summary>Finds the symmetry preserving HNFs for the hexagonal
  !!lattice with determinant n. Assuming the basis of A =
  !![[0,0,-0.5],[1,0,0],[-0.5,0.8660254037844386,0]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE hex_22(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    integer :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j,k, l
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    integer :: gamma21, gamma22, gamma11, gamma12

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in hex_22."

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if (MOD(f,c) ==0) then
          do e=0,f-1,c
             if(MOD(e*e,c)==0)then
               gamma22 = -c+e-(e*e)/c
               gamma21 = -c+(e*2)
               if ((MOD(gamma21,f)==0) .and. (MOD(gamma22,f)==0)) then
                  do b=0,c-1
                     do d=0,f-1,c
                        gamma11 = -b+d*2
                        if(MOD(d*e,c)==0)then
                          gamma12 = -b+d-(d*e)/c
                          if ((MOD(gamma11,f)==0) .and. (MOD(gamma12,f)==0)) then
                             nhnfs = nhnfs + 1
                             temp_HNFs(:,:,nhnfs) = reshape((/ a, b, d, &
                                  0, c, e, &
                                  0, 0, f/),(/3,3/))
                          end if
                        end if
                     end do
                  end do
               end if
             end if
          end do
       end if
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE hex_22

  !!<summary>Finds the symmetry preserving HNFs for the rhombohedral
  !!lattice with determinant n. Assuming the basis of A =
  !![[1,2,2],[2,1,2],[4,3,3]]for basis 9, A = [[-0.255922,-1.44338,0.92259],
  !![1.51184,0,-0.845178],[1.255922,1.44338,0.07741]]
	!!for basis 24.</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>

  SUBROUTINE rhom_9_24(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp) :: beta13, beta22, beta12, gamma11, gamma12, gamma21, gamma22
    real(dp), allocatable :: bs(:)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in rhom_9_24."

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if (MOD(f,a)==0) then
          if (MOD(c,2.0_dp)==0) then
             allocate(bs(2))
             bs = (/0.0_dp, (c/2.0_dp) /)
          else
             allocate(bs(1))
             bs = (/0.0_dp/)
          end if

          do j = 1,size(bs)
             b = bs(j)
             beta13 = f+b*f/a
             if (MOD(beta13,c)==0) then
                e = 0.0_dp
                do while (e <f)
                   beta22 = e + b*e/a
                   gamma21 = c + 2*e
                   gamma11 = b + 2*b*e/c
                   if ((MOD(beta22,c)==0) .and. (MOD(gamma21,f)==0) .and. (MOD(gamma11,f)==0)) then
                      d = 0.0_dp
                      do while (d < f)
                         beta12 = -a + b + d + d*b/a
                         gamma12 = -b -d + (d*d/a) - e*beta12/c
                         gamma22 = -c -2*e + (d*e/a) - e*beta22/c
                         if ((MOD(beta12,c)==0) .and. (MOD(gamma12,f)==0) .and. (MOD(gamma22,f)==0)) then
                            nhnfs = nhnfs + 1
                            temp_HNFs(:,:,nhnfs) = reshape((/ int(a), int(b), int(d), &
                                 0, int(c), int(e), &
                                 0, 0, int(f)/),(/3,3/))
                         end if
                         d = d + a
                      end do
                   end if
                   e = e+a
                end do
             end if
          end do
          deallocate(bs)
       end if
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE rhom_9_24

  !!<summary>Finds the symmetry preserving HNFs for the rhombohedral
  !!lattice with determinant n. Assuming A = [[-1.11652,-0.610985,0.616515],
  !![0.0,-1.32288,-0.5],[1.0,1.32288,1.5]]for basis 2 and A =
  !![[-0.548584,0.774292,1.04858],[0.0,-1.32288,0.5],[1.0,1.32288,0.5]]
  !!for basis 4.</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE rhom_4_2(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    integer :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer(si) :: nbs
    integer, allocatable :: temp_HNFs(:,:,:)

    integer :: beta32,beta22,gamma11,gamma21,beta12,gamma12,gamma22
    integer :: bs(2)

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

       if (MOD(f,a)==0)then
         if (MOD(c,2)==0) then
            nbs = 2
            bs = (/0,c/2/)
         else
            nbs = 1
            bs = (/0,-1/)
         end if
         do j=1, nbs
           b = bs(j)
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
     end if
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  END SUBROUTINE rhom_4_2

  !!<summary>Finds the symmetry preserving HNFs for the simple
  !!tetragonal lattice with determinant n. Assuming the basis of A =
  !![[1,0,0],[0,1,0],[0,0,2]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE st_11(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp) :: beta13, gamma13, gamma12, gamma23
    real(dp), allocatable :: bs(:), es(:)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in st_11."

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if (MOD(c,a)==0) then
          if (MOD(c,2.0_dp)==0) then
             allocate(bs(2))
             bs = (/0.0_dp,(c/2.0_dp)/)
          else
             allocate(bs(1))
             bs = (/0.0_dp/)
          end if

          if (MOD(f,2.0_dp)==0) then
             allocate(es(2))
             es = (/0.0_dp,(f/2.0_dp)/)
          else
             allocate(es(1))
             es = (/0.0_dp/)
          end if
          do j =1,size(bs)
             b = bs(j)
             beta13 = -a + b*b/a
             if (MOD(beta13,c)==0) then
                do k = 1,size(es)
                   e = es(k)
                   gamma12 = 2*b*e/c
                   if (MOD(gamma12,f)==0) then
                      do z =0,int(f-1)
                         d = real(z,dp)
                         gamma13 = -e*beta13/c + d*(b/a-1)
                         gamma23 = -e*(b/a+1) +d*c/a
                         if ((MOD(gamma13,f)==0) .and. (MOD(gamma23,f)==0)) then
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
          deallocate(bs,es)
       end if
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE st_11

  !!<summary>Finds the symmetry preserving HNFs for the simple
  !!tetragonal lattice with determinant n. Assuming the basis of A =
  !![[0,0,0.5],[1,0,0],[0,1,0]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE st_21(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp) :: beta13, gamma13, gamma12, gamma23
    real(dp), allocatable :: bs(:), es(:)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in st_21."

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if (MOD(f,c)==0) then
          if (MOD(c,2.0_dp)==0) then
             allocate(bs(2))
             bs = (/0.0_dp,(c/2.0_dp)/)
          else
             allocate(bs(1))
             bs = (/0.0_dp/)
          end if
          do j=1,size(bs)
             b = bs(j)
             if (MOD(f,2.0_dp)==0) then
                allocate(es(2))
                es = (/0.0_dp,(f/2.0_dp)/)
             else
                allocate(es(1))
                es = (/0.0_dp/)
             end if
             do k=1,size(es)
                d = es(k)
                beta13 = b-d
                if (MOD(beta13,c)==0) then
                   do z=1,size(es)
                      e = es(z)
                      gamma12 = 2*d-2*d*e/c
                      gamma13 = -b+d-beta13*e/c
                      gamma23 = -c+e*e/c
                      if ((MOD(gamma12,f)==0) .and. (MOD(gamma13,f)==0) .and. (MOD(gamma23,f)==0)) then
                         nhnfs = nhnfs + 1
                         temp_HNFs(:,:,nhnfs) = reshape((/ int(a), int(b), int(d), &
                              0, int(c), int(e), &
                              0, 0, int(f)/),(/3,3/))
                      end if
                   end do
                end if
             end do
             deallocate(es)
          end do
          deallocate(bs)
       end if
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE st_21

  !!<summary>Finds the symmetry preserving HNFs for the body centered
  !!tetragonal lattice with determinant n. Assuming the basis of
  !!A  = [[1.80278,-1.47253,0.762655],[2.80278,0.13535,-0.791285],
  !![0.80278,-0.47253,2.762655]] for 6,
  !!A = [[1.95095, 1.19163, 0.879663],[0.0, 2.60788, 0.44606],
  !![0.95095, -0.41625, 2.433603]] for 7,
  !!A = [[-1.0,-1.0,2.0],[0.0,-2.0,0.0],[-2.0,0.0,0.0]] for 15,
  !!A = [[-2.0,-1.0,1.0],[-3.0,1.0,0.0],[-1.0,-3.0,0.0]] for 18.</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
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

  !!<summary>Finds the symmetry preserving HNFs for the simple
  !!orthorhombic lattice with determinant n. Assuming the basis of A =
  !![[1,0,0],[0,2,0],[0,0,3]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE so_32(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp), allocatable :: bs(:), es(:), ds(:)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in so_32."

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
       if (MOD(f,2.0_dp)==0) then
          allocate(es(2),ds(2))
          es = (/0.0_dp,real(int(f)/2,dp)/)
          ds = (/0.0_dp,real(int(f)/2,dp)/)
       else
          allocate(es(1),ds(1))
          es = (/0.0_dp/)
          ds = (/0.0_dp/)
       end if

       do j = 1,size(bs)
          b = bs(j)
          do k=1,size(es)
             e = es(k)
             if (MOD((2.0_dp*b*e),(f*c))==0) then
                do z = 1,size(ds)
                   d = ds(z)
                   nhnfs = nhnfs + 1
                   temp_HNFs(:,:,nhnfs) = reshape((/ int(a), int(b), int(d), &
                        0, int(c), int(e), &
                        0, 0, int(f)/),(/3,3/))
                end do
             end if
          end do
       end do
       deallocate(es,ds,bs)
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE so_32

  !!<summary>Finds the symmetry preserving HNFs for the face centered
  !!orthorhombic lattice with determinant n. Assuming the basis of A =
  !![[0,1,1.5],[0.5,0,1.5],[0,0,3]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE fco_26(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp) :: gamma12, gamma13, gamma23
    real(dp), allocatable :: bs(:)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in fco_26."

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if (MOD(c,2.0_dp)==0) then
          allocate(bs(2))
          bs = (/0.0_dp,real(int(c/2.0_dp),dp)/)
       else
          allocate(bs(1))
          bs = (/0.0_dp/)
       end if

       do j=1,size(bs)
          b = bs(j)
          do k = 0,int(f-1.0_dp)
             e = real(k,dp)
             gamma23 = c +2.0_dp*e
             gamma12 = b + 2.0_dp*b*e/c
             if ((MOD(gamma23,f)==0) .and. (MOD(gamma12,f)==0)) then
                do z = 0,int(f-1.0_dp)
                   d = real(z,dp)
                   gamma13 = a +b +2.0_dp*d
                   if (MOD(gamma13,f)==0) then
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

  end SUBROUTINE fco_26

  !!<summary>Finds the symmetry preserving HNFs for the face centered
  !!orthorhombic lattice with determinant n. Assuming the basis of A =
  !![[1.04442, 1.43973, 1.68415], [0.779796, -1.1789, 1.0],
  !![1.779796, -0.1789, 0]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
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

  !!<summary>Finds the symmetry preserving HNFs for the body centered
  !!orthorhombic lattice with determinant n. Assuming the basis of A =
  !![[0.5,1,1.5],[0,2,0],[0,0,3]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE bco_19(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp) :: gamma12, gamma13, beta13
    real(dp), allocatable :: es(:)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in bco_19."

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

       do j = 0, int(c-1.0_dp)
          b = real(j,dp)
          beta13 = a +2.0_dp*b
          if (MOD(beta13,c)==0) then
             do k=1,size(es)
                e = es(k)
                gamma13 = e*beta13/c
                if (MOD(gamma13,f)==0) then
                   do z=0,int(f-1.0_dp)
                      d = real(z,dp)
                      gamma12 = a + 2.0_dp*d
                      if (MOD(gamma12,f)==0) then
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
       deallocate(es)
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE bco_19

  !!<summary>Finds the symmetry preserving HNFs for the body centered
  !!orthorhombic lattice with determinant n. Assuming the basis of A =
  !![[ 1.41144 , 0.0885622, -2.  ], [-0.99868 , 2 .21232 , 1.268178 ],
  !![ 3.41012 , -1.1237578, -1.268178 ]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE bco_8(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp) :: beta21, beta11, gamma21, gamma11, gamma13
    real(dp), allocatable :: bs(:)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in bco_8."

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if (MOD(2*f,c)==0) then
          if (MOD(c,2.0_dp)==0) then
             allocate(bs(2))
             bs = (/0.0_dp,(c/2.0_dp)/)
          else
             allocate(bs(1))
             bs = (/0.0_dp/)
          end if
          do j=1,size(bs)
             b = bs(j)
             do k=0,int(f-1.0_dp)
                e = real(k,dp)
                beta21 = 2.0_dp*e
                gamma21 = -beta21+beta21*e/c
                if ((MOD(beta21,c)==0) .and. (MOD(gamma21,f)==0)) then
                   do z=0,int(f-1.0_dp)
                      d = real(z,dp)
                      beta11 = -a+(2.0_dp*b)-2.0_dp*d
                      gamma11 = -beta11*e/c
                      gamma13 = a+(2.0_dp*d)-beta21*b/c
                      if ((MOD(beta11,c)==0) .and. (MOD(gamma11,f)==0) .and. (MOD(gamma13,f)==0)) then
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
       end if
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE bco_8

  !!<summary>Finds the symmetry preserving HNFs for the body centered
  !!orthorhombic lattice with determinant n. Assuming the basis of A =
  !![[-1.53633, 1.36706, -1.33073], [ 1.  , 1.  , 1.  ], [ 1.61803,
  !!-0.61803, -1.  ]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE bco_42(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp) :: beta11, gamma12, gamma11, gamma13
    real(dp), allocatable :: es(:)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in bco_42."

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if (MOD(f,2.0_dp)==0) then
          allocate(es(2))
          es = (/0.0_dp,(f/2.0_dp)/)
       else
          allocate(es(1))
          es = (/0.0_dp/)
       end if

       do j=1,size(es)
          e = es(j)
          do k=0,int(c-1.0_dp)
             b = real(k,dp)
             beta11 = -a+2.0_dp*b
             gamma12 = -beta11*e/c
             if ((MOD(beta11,c)==0) .and. (MOD(gamma12,f)==0)) then
                do z=0,int(f-1.0_dp)
                   d = real(z,dp)
                   gamma11 = -a+(2.0_dp*d)-beta11*e/c
                   gamma13 = -a+2.0_dp*d
                   if ((MOD(gamma11,f)==0) .and. (MOD(gamma13,f)==0)) then
                      nhnfs = nhnfs + 1
                      temp_HNFs(:,:,nhnfs) = reshape((/ int(a), int(b), int(d), &
                           0, int(c), int(e), &
                           0, 0, int(f)/),(/3,3/))
                   end if
                end do
             end if
          end do
       end do
       deallocate(es)
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE bco_42

  !!<summary>Finds the symmetry preserving HNFs for the base centered
  !!orthorhombic lattice with determinant n. Assuming A =
  !![[0.5,1,0],[0.5,-1,0],[0,0,3]] (1st basis choince in
  !!notes/base_ortho) for case 38 and A = [[ 1.  , 1.  , 1.  ], [ 1.
  !!, -1.  , -1.  ], [ 0.  , -1.73205, 1.73205]] for case
  !!13.</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE baseco_38_13(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp) :: gamma13, gamma23, beta13
    real(dp), allocatable :: es(:), ds(:)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in baseco_38_13."

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if (MOD(c,a)==0) then
          if (MOD(f,2.0_dp)==0) then
             allocate(es(2),ds(2))
             es = (/0.0_dp,real(int(f)/2,dp)/)
             ds = (/0.0_dp,real(int(f)/2,dp)/)
          else
             allocate(es(1),ds(1))
             es = (/0.0_dp/)
             ds = (/0.0_dp/)
          end if

          b = 0.0_dp
          do while (b<c)
             beta13 = -a +b*b/a
             if (MOD(beta13,c)==0) then
                do j = 1,size(es)
                   e = es(j)
                   do k = 1,size(ds)
                      d = ds(k)
                      gamma13 = -d + b*d/a -e*beta13/c
                      gamma23 = c*d/a -e -b*e/a
                      if ((MOD(gamma13,f)==0) .and. (MOD(gamma23,f)==0)) then
                         nhnfs = nhnfs + 1
                         temp_HNFs(:,:,nhnfs) = reshape((/ int(a), int(b), int(d), &
                              0, int(c), int(e), &
                              0, 0, int(f)/),(/3,3/))
                      end if
                   end do
                end do
             end if
             b = b + a
          end do
          deallocate(es,ds)
       end if
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE baseco_38_13

  !!<summary>Finds the symmetry preserving HNFs for the base centered
  !!orthorhombic lattice with determinant n. Assuming A =
  !![[-0.3333333, -1.54116 , 1.87449 ], [ 1.  , 1.  , 1.  ], [ 2.  ,
  !!-1.  , -1.  ]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE baseco_23(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp) :: beta13, gamma13, gamma23
    real(dp), allocatable :: es(:), bs(:)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in baseco_23."

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if (MOD(f,a)==0) then
          if (MOD(c,2.0_dp)==0) then
             allocate(bs(2))
             bs = (/0.0_dp, (c/2.0_dp)/)
          else
             allocate(bs(1))
             bs = (/0.0_dp/)
          end if
          if (MOD(f,2.0_dp)==0) then
             allocate(es(2))
             es = (/0.0_dp, (f/2.0_dp)/)
          else
             allocate(es(1))
             es = (/0.0_dp/)
          end if

          do j=1,size(bs)
             b = bs(j)
             if (MOD(b*f,a*c)==0) then
                do k=1,size(es)
                   e = es(k)
                   if ((MOD(b*e,a*c)==0) .and. (MOD(2.0_dp*b*e,c*f)==0) .and. (MOD(e,a)==0)) then
                      do z=0,int(f-1),int(a)
                         d = real(z,dp)
                         beta13 = -b+b*d/a
                         gamma13 = -a+(d*d/a)-beta13*e/c
                         gamma23 = e+(d*e/a)-b*e*e/(a*c)
                         if ((MOD(beta13,c)==0) .and. (MOD(gamma13,f)==0) .and. (MOD(gamma23,f)==0)) then
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
          deallocate(bs,es)
       end if
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE baseco_23

  !!<summary>Finds the symmetry preserving HNFs for the base centered
  !!orthorhombic lattice with determinant n. Assuming A = [[ 1.  , 1.
  !!, 1.  ], [ 1.61803 , -0.618034, -1.  ], [-1.05557 , 1.99895 ,
  !!-0.943376]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE baseco_40(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp) :: beta13, gamma13, gamma12, gamma22

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in baseco_40."

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if (MOD(f,c)==0) then
          do j=0,int(f-1.0_dp),int(c)
             e = j
             gamma22 = 2.0_dp*e-e*e/c
             if (MOD(gamma22,f)==0) then
                do k=0,int(f-1.0_dp),int(c)
                   d = k
                   gamma12 = 2.0_dp*d-d*e/c
                   if (MOD(gamma12,f)==0) then
                      do z=0,int(c-1.0_dp)
                         b = real(z,dp)
                         beta13 = 2.0_dp*b-d
                         gamma13 = beta13*e/c
                         if ((MOD(beta13,c)==0) .and. (MOD(gamma13,f)==0)) then
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
       end if
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE baseco_40

  !!<summary>Finds the symmetry preserving HNFs for the base centered
  !!orthorhombic lattice with determinant n. Assuming A = [[1, 1, 1],
  !![1.41421, -1.41421, 0], [-1.43541, -1.43541, 1.37083]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE baseco_36(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp) :: beta12, beta22, beta32, gamma13, gamma12, gamma22
    real(dp), allocatable :: bs(:), es(:)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in baseco_36."

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if (MOD(f,a)==0) then
          if (MOD(f,2.0_dp)==0) then
             allocate(es(2))
             es = (/0.0_dp,(f/2.0_dp)/)
          else
             allocate(es(1))
             es = (/0.0_dp/)
          end if
          if (MOD(c,2.0_dp)==0) then
             allocate(bs(2))
             bs = (/0.0_dp, (c/2.0_dp)/)
          else
             allocate(bs(1))
             bs = (/0.0_dp/)
          end if

          do j=1,size(bs)
             b = bs(j)
             beta32 = -b*f/a
             if (MOD(beta32,c)==0) then
                do k=1,size(es)
                   e = es(k)
                   beta22 = -b*e/a
                   gamma13 = -2.0_dp*b*e/c
                   if ((MOD(beta22,c)==0) .and. (MOD(gamma13,f)==0) .and. (MOD(e,a)==0)) then
                      do z=0,int(f-1)
                         d = real(z,dp)
                         beta12 = -b*d/a
                         gamma12 = 2.0_dp*d-(d*d/a)-beta12*e/c
                         gamma22 = 2.0_dp*e-(d*e/a)-beta22*e/c
                         if ((MOD(beta12,c)==0) .and. (MOD(gamma12,f)==0) .and. (MOD(gamma22,f)==0)) then
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
          deallocate(es,bs)
       end if
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE baseco_36

  !!<summary>Finds the symmetry preserving HNFs for the simple
  !!monoclinic lattice with determinant n. Assuming the basis of A =
  !![[2,0,0],[0,2,0],[0.5,0,2]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE sm_33(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp) :: gamma12
    real(dp), allocatable :: es(:), bs(:)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in sm_33."

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
       if (MOD(f,2.0_dp)==0) then
          allocate(es(2))
          es = (/0.0_dp,real(int(f)/2,dp)/)
       else
          allocate(es(1))
          es = (/0.0_dp/)
       end if

       do j=1,size(bs)
          b = bs(j)
          do k=1,size(es)
             e = es(k)
             gamma12 = 2.0_dp*b*e/c
             if (MOD(gamma12,f)==0) then
                do z=0,int(f-1.0_dp)
                   d = real(z,dp)
                   nhnfs = nhnfs + 1
                   temp_HNFs(:,:,nhnfs) = reshape((/ int(a), int(b), int(d), &
                        0, int(c), int(e), &
                        0, 0, int(f)/),(/3,3/))
                end do
             end if
          end do
       end do
       deallocate(es,bs)
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE sm_33

  !!<summary>Finds the symmetry preserving HNFs for the simple
  !!monoclinic lattice with determinant n. Assuming the basis of A =
  !![[1,1,1],[1.22474487,-1.22474487,-1],[-0.16598509,-1.64308297,1.80906806]]
  !!for 34, and a =  =[[-0.668912,1.96676,-1.29785],[1.61803,-0.618034,-1.0]
  !!,[1.0,1.0,1.0]] for 35.</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE sm_34_35(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp), allocatable :: ds(:), es(:)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in sm_34_35."

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if (MOD(f,2.0_dp)==0) then
          allocate(ds(2),es(2))
          ds = (/0.0_dp,(f/2.0_dp)/)
          es = (/0.0_dp,(f/2.0_dp)/)
       else
          allocate(ds(1),es(1))
          ds = (/0.0_dp/)
          es = (/0.0_dp/)
       end if

       do j=1,size(ds)
          d = ds(j)
          do k=1,size(es)
             e = es(k)
             do z=0,int(c-1.0_dp)
                b = real(z,dp)
                nhnfs = nhnfs + 1
                temp_HNFs(:,:,nhnfs) = reshape((/ int(a), int(b), int(d), &
                     0, int(c), int(e), &
                     0, 0, int(f)/),(/3,3/))
             end do
          end do
       end do
       deallocate(ds,es)
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE sm_34_35

  !!<summary>Finds the symmetry preserving HNFs for the base centered
  !!monoclinic lattice with determinant n. Assuming:
	!!for basis 10 A = [[1, -1, 1],[-1.46391, 0, 1.96391],[0, 2, 0]],
	!!for basis 14 A = [[-1,1,0],[0.5,0,2],[0,-2,0]],
	!!for basis 17 A = [[-1.05387,-1.61088,1.51474],[-0.244302,-2.77045,0.51474],[1.809568,-0.15957,0.0]]
	!!for basis 27 A = [[0.0,-1.73205,-1.0],[-1.66542,-0.672857,1.66542],[1.0,0.0,1.0]],
	!!for basis 37 A = [[-1.79092,-1.47209,0.790922],[1.0,-1.41421,-1.0],[1.0,0.0,1.0]],
	!!for basis 39 A = [[0, -1.73205,-1],[-1.66542, -0.672857, 1.66542], [1,0,1]],
	!!for basis 41 A = [[-1.85397, -0.854143, 1.35397],[1, 0, 1],[1, -1.41421, -1]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE basecm_10_14_17_27_37_39_41(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    integer :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    integer :: gamma11
    integer, allocatable :: es(:)

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

       if (MOD(f,2)==0) then
          allocate(es(2))
          es = (/0,f/2/)
       else
          allocate(es(1))
          es = (/0/)
       end if

       do j=1,size(es)
         do d=0,f-1
           e = es(j)
           gamma11 = -1*a + 2*d
           if (MOD(gamma11,f)==0) then
             do b=0,c-1
               nhnfs = nhnfs + 1
               temp_HNFs(:,:,nhnfs) = reshape((/ a, b, d, &
               0, c, e, &
               0, 0, f/),(/3,3/))
             end do
            end if
          end do
        end do
       deallocate(es)
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE basecm_10_14_17_27_37_39_41

  !!<summary>Finds the symmetry preserving HNFs for the base centered
  !!monoclinic lattice with determinant n. Assuming for basis 20 A =
  !![[ 1.  , 1.  , 1.  ], [ 1.70119 , -1.45119 , 1.  ], [ 0.69779 ,
  !!-1.4322505, 3.23446 ]], for basis 25 A = [[ 1.  , 1.  , 1.  ], [ 1
  !!.45119, -1.70119, -1.  ], [ 0.28878, -3.26895,
  !!0.48018]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE basecm_20_25(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp) :: gamma12, gamma22
    real(dp), allocatable :: bs(:)

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in basecm_20_25."

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if (MOD(c,2.0_dp)==0) then
          allocate(bs(2))
          bs = (/0.0_dp,(c/2.0_dp)/)
       else
          allocate(bs(1))
          bs = (/0.0_dp/)
       end if

       do j=0,int(f-1.0_dp)
          e = real(j,dp)
          gamma22 = -c-2.0_dp*e
          if (MOD(gamma22,f)==0) then
             do k=1,size(bs)
                b = bs(k)
                gamma12 = -b-2.0_dp*b*e/c
                if (MOD(gamma12,f)==0) then
                   do z=0,int(f-1.0_dp)
                      d = real(z,dp)
                      nhnfs = nhnfs + 1
                      temp_HNFs(:,:,nhnfs) = reshape((/ int(a), int(b), int(d), &
                           0, int(c), int(e), &
                           0, 0, int(f)/),(/3,3/))
                   end do
                end if
             end do
          end if
       end do
       deallocate(bs)
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE basecm_20_25

  !!<summary>Finds the symmetry preserving HNFs for the base centered
  !!monoclinic lattice with determinant n. Assuming A = [[-1.44896 ,
  !!0.948958, -1.  ], [-1.  , -1.  , 0.  ], [ 0.342424, -1.342424,
  !!-2.02006 ]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE basecm_28(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp) :: gamma21, gamma11

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in basecm_28."

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if (MOD(f,c)==0) then
          do j=0,int(f-1.0_dp),int(c)
             e = real(j,dp)
             gamma21 = 2.0_dp*e+e*e/c
             if (MOD(gamma21,f)==0) then
                do k=0,int(f-1.0_dp),int(c)
                   d = real(k,dp)
                   gamma11 = 2.0_dp*d+d*e/c
                   if (MOD(gamma11,f)==0) then
                      do z=0,int(c-1.0_dp)
                         b = real(z,dp)
                         nhnfs = nhnfs + 1
                         temp_HNFs(:,:,nhnfs) = reshape((/ int(a), int(b), int(d), &
                              0, int(c), int(e), &
                              0, 0, int(f)/),(/3,3/))
                      end do
                   end if
                end do
             end if
          end do
       end if
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE basecm_28

  !!<summary>Finds the symmetry preserving HNFs for the base centered
  !!monoclinic lattice with determinant n. Assuming for basis 29 A =
  !![[-0.666125, 1.16613 , 2.04852 ], [ 1.  , 1.  , 0.  ], [ 1.61803 ,
  !!-0.618034, 1.  ]], for basis 30 A = [[ 1.  , 1.  , 0.  ], [
  !!1.61803 , -0.618034 , 1.  ], [-0.0361373, 0.536137 , 2.38982
  !!]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE basecm_29_30(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp) :: gamma21, gamma11

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in basecm_29_30."

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if (MOD(f,c)==0) then
          do j=0,int(f-1.0_dp),int(c)
             e = real(j,dp)
             gamma21 = 2.0_dp*e+e*e/c
             if (MOD(gamma21,f)==0) then
                do k=0,int(f-1.0_dp),int(c)
                   d = real(k,dp)
                   gamma11 = 2.0_dp*d+d*e/c
                   if (MOD(gamma11,f)==0) then
                      do z=0,int(c-1.0_dp)
                         b = real(z,dp)
                         nhnfs = nhnfs + 1
                         temp_HNFs(:,:,nhnfs) = reshape((/ int(a), int(b), int(d), &
                              0, int(c), int(e), &
                              0, 0, int(f)/),(/3,3/))
                      end do
                   end if
                end do
             end if
          end do
       end if
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE basecm_29_30

  !!<summary>Finds the symmetry preserving HNFs for the base centered
  !!monoclinic lattice with determinant n. Assuming A = [[-0.39716,
  !!-0.34718, 2.49434], [ 2.64194, -0.14194, 0.  ], [-1.39716,
  !!-1.34718, 1.49434]].</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE basecm_43(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer :: diagonals(:,:) => null()
    real(dp) :: a,b,c,d,e,f
    integer :: nds, i, nhnfs, status, j, k, z
    integer(li) :: total_hnfs
    integer, allocatable :: temp_HNFs(:,:,:)

    real(dp) :: beta12, gamma12, gamma22

    call get_HNF_diagonals(n,diagonals)

    nds = size(diagonals,2)
    nhnfs = 0
    total_hnfs = 0

    do i = 1,nds
       total_hnfs = total_hnfs + diagonals(2,i)*diagonals(3,i)**2
    end do

    allocate(temp_HNFs(3,3,total_hnfs),STAT=status)
    if (status/=0) stop "Failed to allocate memory in basecm_43."

    do i =1,nds
       a = diagonals(1,i)
       c = diagonals(2,i)
       f = diagonals(3,i)

       if (MOD(f,c)==0) then
          do j=0,int(f-1.0_dp),int(c)
             e = real(j,dp)
             gamma22 = 2.0_dp*e-e*e/c
             if (MOD(gamma22,f)==0) then
                do k=0,int(f-1.0_dp)
                   d = real(k,dp)
                   beta12 = a+d
                   gamma12 = 2.0_dp*a+2.0_dp*d-beta12*e/c
                   if ((MOD(beta12,c)==0) .and. (MOD(gamma12,f)==0)) then
                      do z=0,int(c-1.0_dp)
                         b = real(z,dp)
                         nhnfs = nhnfs + 1
                         temp_HNFs(:,:,nhnfs) = reshape((/ int(a), int(b), int(d), &
                              0, int(c), int(e), &
                              0, 0, int(f)/),(/3,3/))
                      end do
                   end if
                end do
             end if
          end do
       end if
    end do

    allocate(spHNFs(3,3,nhnfs))

    spHNFs(:,:,1:nhnfs) = temp_HNFs(:,:,1:nhnfs)

  end SUBROUTINE basecm_43

  !!<summary>Finds the symmetry preserving HNFs for the triclinic
  !!lattice with determinant n. Subroutine taken form enumlib on 7/20/17.</summary>
  !!<parameter name="n" regular="true">The target determinant of the
  !!HNFs.</parameter>
  !!<parameter name="spHNFs" regular="true">The symmetry preserving
  !!HNFs.</parameter>
  SUBROUTINE tric_31_44(n,spHNFs)
    integer, intent(in) :: n
    integer, allocatable, intent(out) :: spHNFs(:,:,:)

    integer, pointer    :: d(:,:) => null()
    integer             :: i, j, k, l    ! Loop counters
    integer             :: Nds, Nhnf, ihnf ! # of triplets, # of HNF matrices, HNF counter
    integer             :: status

    call get_HNF_diagonals(n,d)
    Nds = size(d,2)

    ! Count the total number of HNF matrices for given determinant (n)
    Nhnf = 0
    do i = 1,Nds
       Nhnf = Nhnf + d(2,i)*d(3,i)**2
    enddo

    allocate(spHNFs(3,3,Nhnf),STAT=status)
    if(status/=0) stop "Failed to allocate memory in tric"
    ihnf = 0
    do i = 1,Nds ! Loop over the permutations of the diagonal elements of the HFNs
       do j = 0,d(2,i)-1  ! Look over possible values of row 2, element 1
          do k = 0,d(3,i)-1  ! Ditto for row 3, element 1
             do l = 0,d(3,i)-1  ! Ditto for row 3, element 2
                ihnf = ihnf+1 ! Count the HNFs and construct the next one
                spHNFs(:,:,ihnf) = reshape((/ d(1,i),      j,     k,        &
                     0, d(2,i),     l,        &
                     0,      0, d(3,i)  /), (/3,3/))
             enddo
          enddo
       enddo  ! End loops over values for off-diagonal elements
    enddo ! End loop over all unique triplets of target determinant (n)

    if (ihnf /= Nhnf) stop "HNF: not all the matrices were generated...(bug!)"
  end SUBROUTINE tric_31_44

  !!<summary>Finds the smallest prime factor of the given positive integer.</summary>
  !!<parameter name="a" regular="true">A positive integer number.</parameter>
  !!<parameter name="sp" regular="true">The smallest prime factor of a.</parameter>
  SUBROUTINE smallest_prime(a,sp)
    integer, intent(in) :: a
    integer, intent(out) :: sp

    integer ::i

    if (a<0) stop "smallest_prime is only designed for positive integers."
    if (a <= 2) then
       sp = a
    else
       do i = 2, a
          if (MOD(a,i)==0) then
             sp = i
             exit
          end if
       end do
    end if

  end SUBROUTINE smallest_prime

  !!<summary>Finds all the possible diagonals of the HNF matrices of a
  !!given size. Subroutine taken from enumlib on 7/18/17.</summary>
  !!<parameter name="detS" regular="true">Cell size, i.e., determinant
  !!of S matrix.</parameter>
  !!<parameter name="diagonals">All possible diagonals.</parameter>
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

end Module int_sp_hnfs

program test
  use int_sp_hnfs
  character(len = 10) :: arg1
  integer :: n=10,narg, arrSize,i = 1
  integer, allocatable :: spHNFs(:,:,:)

  narg = command_argument_count()
  if(narg == 1)then
    call get_command_argument(1,arg1)
    !write(*,*),arg1
    read(arg1,*) n

  else
    stop "No determinant size given"
  end if

  !write(*,*),"Det Size:",n

  call hex_12(n,spHNFs)

  arrSize = size(spHNFs,3)
  open (unit = 1, file = 'fort_spHNFs.txt', form='formatted')
  !write(*,*), arrSize
  do i = 1,arrSize
    write(1,*) spHNFs(1:3,1,i)
    write(1,*) spHNFs(1:3,2,i)
    write(1,*) spHNFs(1:3,3,i)
  enddo
  close(1)

END program test
