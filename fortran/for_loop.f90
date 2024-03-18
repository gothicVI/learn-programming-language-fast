program for_loop
    use,intrinsic :: ISO_Fortran_env

    implicit none

    integer(INT32) :: solution, i, guess ! 32bit precisions
    real(REAL32) :: r ! 32bit precision

    call random_seed()

    ! generate a random real number from [0, 1) and store it in r
    call random_number(r)

    ! multiply with 101 (1 is excluded!) and use the floor function
    ! to convert to an integer; 101 is a 32bit real as well to allow
    ! for real times real multiplication without implicit type casting
    solution = floor(r * 101._REAL32)

    write(*,*) "You have 10 tries to guess my number between 1 and 100."

    ! every for loop is a do loop - fortran only comes with the latter
    do i=1, 10, 1
        write(*,*) i, "/10 What's your guess?"
        read(*,*) guess
        if (guess < solution) then
            write(*,*) "My number is bigger."
        else if (guess > solution) then
            write(*,*) "My number is smaller."
        else
            write(*,*) "That's it. You guessed it."
            call exit(0)
        end if
    end do

    write(*,*) "Ohh you didn't guess it. :("
    call exit(1)

end program for_loop
