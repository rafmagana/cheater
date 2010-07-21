#help
:h $subject #help on subject, ie. :h undo or :h filters

#accessing the modes
i #insert mode before the current position
a #insert mode after current position (append)
v #switch to the visual mode (character oriented)

I #jump to the first non-blank character in the current line and switch to the insert mode
A #jump to the last character of the current line and switch to the insert mode
V #switch to the visual mode (line oriented)
C-v #switch to the block-visual mode (select rectangles of text)

#MOVEMENT
h #move left
l #move right
j #move up
k #move down

H #top of the visible area
M #middle of the visible area
L #bottom of the visible area
G #To get to the end of the file hit
gg #to get to the beginning of the file
$nG #go to line $n
C-g #number of lines

#going up
C-e #1 line up
C-d #1/2 page up
C-f #1 page up

#going down
C-y #1 line down
C-u #1/2 page down
C-b #1 page down

#cursor
0 ^ gE B ge b *cursor* e w E W g_ $
2[( [{ [( *cursor* ]) ]} 2]}

#EDITING
d #delete from the current position up to position given by the next command
dd #deletes the whole line
c #change from the current position up to position given by the next command
x #delete character under cursor
X #backspace
p #paste previous deleted or yanked (copied) text after the current cursor position.
P #paste previous deleted or yanked (copied) text before the current cursor position.
r #replace the current character with the newly typed one
s #substitute the text from the current cursor position up to the position given by the next command with the newly typed one.
. #repeat the last insertion or editing command (x,d,p…).

#UNDO/REDO
u #undo
C-r #redo

#COPY/PASTE
"{register_name}yy #copies the entire line into {register_name}
"{register_name}p #pastes the {register_name}
:registers #show the registers

Y #yanks (copies) one line; 2Y copies 2 lines
yy #yanks (copies) one line; yG copies to the end of the file

#WORKING ON TEXT OBJECTS
iw #inner word
aw #a word
iW #inner WORD
aW #a WORD
is #inner sentence
as #a sentence
ip #inner paragraph
ap #a paragraph
i( or i) #inner block
a( or a) #a block
i< or i> #inner block
a< or i> #a block
i{ or i} #inner block
a{ or a} #a block
i" #inner block
a" #a block
i" #inner block
a" #a block
i` #inner block
a` #a block

#SEARCHING
/ #search forward direction
? #search backward direction
n, N #research in forward or backward direction

#REPLACING
:%s/old/new/gc #take the whole file (%) and substitute (s) the word "old" with "new" in one line (g) and ask confirmation (c)
:s/old/new/g #replaces selection (select with visual mode)

#COMPLETION
C-p #searches currently typed text backwards for a word starting with characters already typeds
C-x C-l #completes the whole line

#MARKS
:marks #show available marks
m{a-zA-Z} #(m followed by either a,b..z or A,B,..Z) lowercase are local to file, uppercase are stored and available over sessions
'' #jump
`` #jump
:delmarks #deletes all marks
:delmarks a b c #deletes a,b and c marks

#TABS
vim -p *.txt #open files in many tabs in command line
gt #switch to next tab
gT #switch to previous tab
:tabnew #new tab
:tabe $file_name #open #file_name in a new tab

#WINDOWS
:sp [$file] #split in two windows horizontally and open $file
:vsp [$file] #split in twi windows vertically and open $file
C-w {hjkl}||arrows #switch between windows
:q #closes current window and vim if it's the last one
:new #new empty window
:on #close all the windows but active one (C-W o)

#BUFFERS
:b $N #switch to buffer number $N
:buffers #show list of buffers
:bd #unload the buffer
:bun #unload buffer but stays in buffer list
:sp $N #split current window and edit buffer $N
:w [$file]#writes buffer to disk (if you use visual mode it saves the selection to $file)
:r $file #retrieve contents of a file to the current buffer
:e $file #loads $file from disk

#MACROS
q {0-9a-zA-Z} #start a macro and records the macro. ie. "qq" records the macro in buffer "q"
@{0-9a-zA-Z} #runs a macro

#EXTERNAL COMMANDS
:!$command #run $command
:!$command % # send the name of the file as a parameter to $command
:r!$command #insert the output of the external command in the current file

#CUSTOMIZE VIM
:set incsearch #incremental search
:set ignorecase
:set smartcase