program hello_name
    implicit none

    character(100) :: name

    write(*,*) "what is your name?"
    ! "(a)" designates the input as string
    ! and thus does not split at spaces
    read(*,"(a)") name
    write(*,*) "hello ", trim(name)

end program hello_name
