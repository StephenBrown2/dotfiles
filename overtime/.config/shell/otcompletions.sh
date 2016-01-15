function _otcompletion () {
        local cur results
        cur="${COMP_WORDS[COMP_CWORD]}"
        # Check if the completion starts with a number indicating we are using a server number to search for names
        if [[ $2 =~ ^[0-9]+ ]]
        then
                results=`echo "SELECT server FROM computer WHERE server LIKE '$2%';" | sqlite3 ~/.config/overtime/cache/cache.db`
        else
                results=`echo "SELECT server_name FROM computer WHERE server_name LIKE '%$2%';" | sqlite3 ~/.config/overtime/cache/cache.db | sed 's/^[0-9]*-//'`
        fi
        COMPREPLY=( `compgen -W "${results}" -- ${cur}` )
        return 0
}
complete -F _otcompletion ot
