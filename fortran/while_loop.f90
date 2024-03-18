program while_loop
    use,intrinsic :: ISO_Fortran_env

    implicit none

    logical :: running, correct
    integer(INT32) :: solution, guess, i ! 32bit precisions
    real(REAL32) :: r ! 32bit precision
    character(100) :: input

    call random_seed()
    running = .true.

    do while (running)
        ! generate a random real number from [0, 1) and store it in r
        call random_number(r)
        ! multiply with 101 (1 is excluded!) and use the floor function
        ! to convert to an integer; 101 is a 32bit real as well to allow
        ! for real times real multiplication without implicit type casting
        solution = floor(r * 101._REAL32)
        correct = .false.

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
            correct = .true.
                write(*,*) "That's it. You guessed it."
                exit
            end if
        end do

        if (.not. correct) then
            write(*,*) "Ohh you didn't guess it. :("
        end if

        write(*,*) "Do you want to play another round?"
        read(*,*) input
        running = (trim(input) == "yes")
    end do

end program while_loop
