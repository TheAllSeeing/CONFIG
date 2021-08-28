
_source_package() {
    package_name="$1"
    file_path="$2"
    if [ -f "$file_path" ]; then
        source "$file_path"
    else
        echo "could not find $(basename "$file_path") for package $package_name: $file_path is not a file."
    fi
}


_source_package 'command-not-found' '/etc/zsh_command_not_found'
_source_package oh-my-zsh "$OMZ_DIR/custom/omzrc.zsh.init"
