#MYSQL CONSOLE
Use vi-like keybindings adding the following lines to the ~/.inputrc file:
$if Mysql
    set keymap vi
    set editing-mode vi
$endif

\! command #executes command
\G #finish the sentences with this like ; but provide output formatted vertically
\s #quick status
delimiter $string_character_as_delimiter

show processlist;
kill process_id;
show status;
reset master; #clear /usr/local/var/ -bin.000001,-bin.000002,.. log files

#custom prompt
prompt mysql (\d) > #show selected database
prompt mysql (\u@\h)> #show user and host
prompt (\u@\h) [\d]>\_ #show user, host and current selected database and a space

#pager
pager less -n -i -S -F -X
pager less; #defaults pager to less

#environment variables
export MYSQL_PS1="(\u@\h) [\d]> " #show user, host and current selected database
export MYSQL_PS1="\\d@\\h> " #show database name in prompt