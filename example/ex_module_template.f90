program example_module_template
! Checks if module template runs fine.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! 28-04-2025 - Rodrigo Castro - Original code

  use, intrinsic :: iso_fortran_env, only: int64
  use template_module, only: phi, fibonacci

  implicit none
  
  integer(int64), parameter :: n = 10
  integer(int64) :: fib(n)

  fib = fibonacci(n)

  print '(a)', '---------------'
  print '(a)', 'Module template'
  print '(a)', '---------------'
  print '(a, es22.15)', 'phi = ', phi
  print '(a, *(i0, 1x))', 'fib = ', fib(1:n)

end program example_module_template
