#!/usr/bin/env bash

_psql_connections() {
    local cur="${COMP_WORDS[COMP_CWORD]}" 
    local connections

    if [[ -f ~/.pconfig ]]; then
        connections=$(awk '{print $1}' ~/.pconfig | grep -v '^#')
    else
        connections=""
    fi

    COMPREPLY=($(compgen -W "$connections" -- "$cur"))
}

psql_wrapper() {
    local has_flags=false
    for arg in "$@"; do
        if [[ "$arg" =~ ^-[hpdU] ]]; then
            has_flags=true
            break
        fi
    done

    if [[ "$has_flags" == true || $# -gt 1 ]]; then
        /usr/bin/psql "$@"
    elif [[ $# -eq 1 ]]; then
        local connection_name="$1"
        local host port db user

        if [[ -f ~/.pconfig ]]; then
            local line=$(grep "^$connection_name " ~/.pconfig)
            if [[ -n "$line" ]]; then
                host=$(echo "$line" | awk '{print $2}')
                port=$(echo "$line" | awk '{print $3}')
                db=$(echo "$line" | awk '{print $4}')
                user=$(echo "$line" | awk '{print $5}')

                /usr/bin/psql -h "$host" -p "$port" -d "$db" -U "$user"
            else
                echo "Ошибка: подключение '$connection_name' не найдено в ~/.pconfig"
                return 1
            fi
        else
            echo "Ошибка: файл ~/.pconfig не найден"
            return 1
        fi
    else
        /usr/bin/psql
    fi
}

complete -F _psql_connections psql

alias psql=psql_wrapper
