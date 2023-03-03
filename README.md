Настройка VPS на CentOS 7 арендованых у Fozzy

1. Добавить пользователя hes
2. Добавить пользователя hes в группу wheel
3. Создать директорию /home/hes/.ssh
4. Загрузить authorized_keys с ключами с macbook и WSL2
5. Задать права для .ssh и authorized_keys
6. alias s='sudo su -'
7. Выключить SELinux
8. Отконфигурировать ssh (отключить доступ по паролю, отключить рут доступ, листен IP)
