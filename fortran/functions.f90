program functions
    use,intrinsic :: ISO_Fortran_env

    implicit none

    logical :: running, found
    integer(INT32) :: solution

    call random_seed()

    running = .true.

    do while (running)
        solution = generate_solution()
        found = play_game_with_solution(solution)
        if (.not. found) then
            write(*,*) "Ohh you didn't guessed it. :("
        end if

        running = prompt_rematch()
    end do

contains

function prompt_int(text) result(guess)
    use,intrinsic :: ISO_Fortran_env

    implicit none

    character(100), intent(in) :: text
    integer(INT32) :: guess

    write(*,*) trim(text)

    read(*,*) guess

end function prompt_int

function prompt_char(text) result(char)
    implicit none

    character(100), intent(in) :: text
    character(100) :: char

    write(*,*) trim(text)

    read(*,*) char

end function prompt_char

function generate_solution() result(solution)
    use,intrinsic :: ISO_Fortran_env

    implicit none

    real(REAL32) :: r ! 32bit precision
    integer(INT32) :: solution

    ! generate a random real number from [0, 1) and store it in r
    call random_number(r)

    ! multiply with 101 (1 is excluded!) and use the floor function
    ! to convert to an integer; 101 is a 32bit real as well to allow
    ! for real times real multiplication without implicit type casting
    solution = floor(r * 101._REAL32)

end function generate_solution

function play_game_with_solution(solution) result(found)
    use,intrinsic :: ISO_Fortran_env

    implicit none

    integer(INT32), intent(in) :: solution
    integer(INT32) :: i, guess
    character(100) :: prompt_text
    logical :: found

    write(*,*) "You have 10 tries to guess my number between 1 and 100."

    ! every for loop is a do loop - fortran only comes with the latter
    do i=1, 10, 1
        write(prompt_text, *) "[", i, "/10] What's your guess?"
        guess = prompt_int(prompt_text)

        if (guess < solution) then
            write(*,*) "My number is bigger."
        else if (guess > solution) then
            write(*,*) "My number is smaller."
        else
            write(*,*) "That's it. You guessed it."
            found = .true.
            return
        end if
    end do

    found = .false.

end function play_game_with_solution

function prompt_rematch() result(rematch)
    implicit none

    character(100) :: char
    logical :: rematch

    char = prompt_char("Do you want to play another round?")
    rematch = (trim(char) == "yes")

end function prompt_rematch

end program functions
