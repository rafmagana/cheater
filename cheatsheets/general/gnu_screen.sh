#GNU SCREEN - terminal multiplexer

#sharing a terminal
chmod +s /usr/bin/screen #To share a terminal with one or more users, you have to set the screen binary setuid root
screen -S $session_name #Login as root and start a screen session and give it a name
C-a then :multiuser on (to type ":", press "shift+;") #Enable  multi-user access function

#attaching and detaching
screen -r #reattach
screen -DR #list of detached screen
screen -r PID #attach detached screen session
screen -dmS $session_name #start a detached screen session
screen -r $session_name #attach screen session with name MySession
C-a d || C-a C-d #detach window
C-a D D #detach and logout
C-a \ #Kill all windows and terminate screen
C-a ? #help

#launching and switching basics
C-a c # create new window
C-a C-c #switch to that window
C-a C-a #switch you to whichever window you were using before the current one.
C-a C-n #next window
C-a C-p #previous windows
C-a double-quotes #interactive list of windows
C-a w || C-a C-w #no interactive list of windows
C-a single-quotes #ask for a number of window to switch to
C-a A #name a window
C-a K #kill a window
C-a $num #go to window number $num
C-a - #Switch to the blank window
C-a a #send C-a to terminal
C-a [space] || C-a n || C-a C-n #switch to the next window
C-a [backsp] || C-a p || C-a C-p #switch to the previous window

#copying, pasting and scrolling
C-a [ #start copy, move cursor to the copy location, press ENTER, select the chars, press ENTER to copy the selected characters to the buffer
C-a ] #paste from buffer
C-a [ESC] #exit copy mode

#monitoring windows
C-a _ #start or stop monitoring current window for 30 seconds
C-a M #start or stop monitoring current window for activity

#splitted screens
C-a S #create split screen
C-a TAB #switch between split screens
C-a Q #Kill all regions but the current one. (return to full screen mode)
C-a X #remove active window from split screen
C-a O #logout active window (disable output)
C-a I #login active window (enable output)

#buffering
C-a > #write paste buffer to a file
C-a < #read the screen-exchange file into the paste buffer
C-a = #removes the file used by C-a > and C-a <

#misc
C-a b || C-a C-b #Send a break to window
C-a B #Reopen the terminal line and send a break
C-a C || C-l #clear the screen
C-a f || C-a C-f #toggle flow on, off or auto
C-a F #resize window to current region size
C-a C-g #toggles screen's visual bell mode
C-a h #write a hardcopy of the current window to the file "hardcopy.n"
C-a H #Begins/ends logging of the current window to the file "screenlog.n".
C-a i || C-a C-i #show info about this window
C-a k || C-a C-k #destroy current window
C-a l || C-a C-l #fully refresh current window
C-a L #Toggle this windows login slot. Available only if screen is configured to update the utmp database.
C-a m || C-a C-m #Repeat the last message displayed in the message line.
C-a q || C-a C-q #send control-q to the current window
C-a r || C-a C-r #toggle current window wrapping
C-a s || C-a C-s #send a control-s to the current window
C-a t || C-a C-t #show system information
C-a v #display the version and compilation date
C-a C-v #digraph mode
C-a W #toggle 80/132 columns
C-a x || C-a C-x #lock this terminal
C-a z || C-a C-z #suspend screen, return with fg command
C-a Z #reset the virtual terminal to its "power-on" values
C-a . #write out a ".termcap" file
C-a , #shows welcome screen
C-a : #enter command line mode
C-a {, C-a } #copy and paste previous line