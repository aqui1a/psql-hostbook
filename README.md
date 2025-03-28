

### **1. Установка**

1. Скачайте файл `psql-completion.sh` и сохраните его в удобное место, например, в `~/scripts/`.
2. Добавьте следующую строку в ваш файл `~/.bashrc` или `~/.bash_profile`:

```bash
source ~/scripts/psql-completion.sh
```

3. Перезагрузите оболочку:

```bash
source ~/.bashrc
```


### **2. Настройка конфигурационных файлов**

#### **Файл `~/.pconfig`**

Этот файл хранит настройки подключений. Каждая строка описывает одно подключение в формате:

```plaintext
display_name host port db_name user
```

- `display_name` — имя подключения (используется для автодополнения).
- `host` — адрес сервера.
- `port` — порт PostgreSQL.
- `db_name` — имя базы данных.
- `user` — имя пользователя.

Пример:

```plaintext
local_db localhost 5432 my_database my_user
remote_db 192.168.1.100 5432 production_db admin
```


#### **Файл `~/.pgpass`**

Этот файл хранит пароли для подключения к базам данных. Формат:

```plaintext
host:port:db:user:password
```

Пример:

```plaintext
localhost:5432:my_database:my_user:my_password
192.168.1.100:5432:production_db:admin:secure_password
```

**Важно:** Убедитесь, что права доступа к файлу ограничены (только для владельца):

```bash
chmod 600 ~/.pgpass
```


### **3. Использование**

1. Для автодополнения используйте клавишу <kbd>Tab</kbd> после команды `psql`. Например:

```bash
psql loc<Tab>
```

2. Если указано только имя подключения, скрипт автоматически заполнит параметры (`host`, `port`, `db_name`, `user`) из файла `~/.pconfig`. Пример:

```bash
psql local_db
```

3. Вы можете использовать стандартные флаги psql (`-h`, `-p`, `-d`, `-U`) для ручного подключения:

```bash
psql -h localhost -p 5432 -d my_database -U my_user
```


---

## **Instructions in English**

### **1. Installation**

1. Download the file `psql-completion.sh` and save it to a convenient location, e.g., `~/scripts/`.
2. Add the following line to your `~/.bashrc` or `~/.bash_profile`:

```bash
source ~/scripts/psql-completion.sh
```

3. Reload your shell configuration:

```bash
source ~/.bashrc
```


### **2. Configuration Files**

#### **File `~/.pconfig`**

This file stores connection settings. Each line represents a connection in the format:

```plaintext
display_name host port db_name user
```

- `display_name`: Connection name (used for autocompletion).
- `host`: Server address.
- `port`: PostgreSQL port.
- `db_name`: Database name.
- `user`: Username.

Example:

```plaintext
local_db localhost 5432 my_database my_user
remote_db 192.168.1.100 5432 production_db admin
```


#### **File `~/.pgpass`**

This file stores passwords for database connections in the format:

```plaintext
host:port:db:user:password
```

Example:

```plaintext
localhost:5432:my_database:my_user:my_password
192.168.1.100:5432:production_db:admin:secure_password
```

**Important:** Ensure the file has restricted permissions (owner-only access):

```bash
chmod 600 ~/.pgpass
```


### **3. Usage**

1. Use the <kbd>Tab</kbd> key for autocompletion after typing the command `psql`. For example:

```bash
psql loc<Tab>
```

2. If only the connection name is provided, the script will automatically fill in the parameters (`host`, `port`, `db_name`, and `user`) from the file `~/.pconfig`. Example:

```bash
psql local_db
```

3. You can still use standard psql flags (`-h`, `-p`, `-d`, and `-U`) for manual connections:

```bash
psql -h localhost -p 5432 -d my_database -U my_user
```

