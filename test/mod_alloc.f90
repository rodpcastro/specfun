module mod_alloc

  use, intrinsic :: iso_fortran_env, only: real64

  implicit none
  private
  public :: alloc, free

contains

  subroutine alloc(a, n)
    ! Allocates array a with n elements.

    real(real64), allocatable, intent(in out) :: a(:)
    integer, intent(in) :: n
    integer :: stat
    character(len=100) :: errmsg
    if (allocated(a)) call free(a)
    allocate(a(n), stat=stat, errmsg=errmsg)
    if (stat > 0) error stop errmsg
  end subroutine alloc

  subroutine free(a)
    ! Deallocates array a.

    real(real64), allocatable, intent(in out) :: a(:)
    integer :: stat
    character(len=100) :: errmsg
    if (.not. allocated(a)) return
    deallocate(a, stat=stat, errmsg=errmsg)
    if (stat > 0) error stop errmsg
  end subroutine free

end module mod_alloc
