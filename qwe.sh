#!/usr/bin/expect -f

set addedFile "."

spawn sudo -s
expect "#"
send "cd /home/worker/worker-init\r"
expect "#"

send "git status\r"
expect "#"

#установка логина для github
send "git config user.email 'kirill.corschunow@yandex.ru'\r"
expect "#"

#добавление файла в коммит
send "git add $addedFile\r"
expect "#"

#фиксация
send "git commit -m 'commit name'\r"
expect "#"

#пуш файла в репозиторий
send "git push\r"

expect "Username*:"
send "kir0108\n"
expect "Password*:"
send "kir0108github\n"
expect eof
