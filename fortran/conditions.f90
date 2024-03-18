program conditions
    implicit none

    character(100) :: answer

    write(*,*) "SHALL WE PLAY A GAME?"
    read(*,*) answer
    if (trim(answer) == "yes") then
        write(*,*) "HOW ABOUT A NICE GAME OF CHESS?"
    else
        write(*,*) "OKAY THEN!"
    end if
end program conditions
