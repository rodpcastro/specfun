module example_module_template
! Checks if module template runs fine.

  use wildf_kinds, only: i1
  use module_template, only: phi, fibonacci

  implicit none
  private
  public :: example_mod_template

contains
  
  subroutine example_mod_template()
    integer(i1), parameter :: n = 10
    integer(i1) :: fib(n)

    fib = fibonacci(n)

    print '(a)', '---------------'
    print '(a)', 'Module template'
    print '(a)', '---------------'
    print '(a, es22.15)', 'phi = ', phi
    print '(a, *(i0, 1x))', 'fib = ', fib(1:n)
  end subroutine example_mod_template

end module example_module_template
