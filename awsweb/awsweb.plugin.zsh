function _awsweb {
    local line

    _arguments -C \
        "1: :(browser env root set validate)"\
        "*::arg:->args"

    case $line[1] in
        browser)
            _awsweb_browser
        ;;
    esac    
}

function _awsweb_browser {
    compadd -- $("$ZSH_CUSTOM/plugins/awsweb/getprofilenames.ps1")
}

compdef _awsweb awsweb