if test -e /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
    if test -e "$(brew --prefix)/var/run/yubikey-agent.sock"
        set -gx SSH_AUTH_SOCK (brew --prefix)/var/run/yubikey-agent.sock
    end
    if test -d (brew --prefix openssh)/bin
        fish_add_path (brew --prefix openssh)/bin
    end
end

# compiler
if test -d /usr/local/opt/bzip2/bin && test -d /usr/local/opt/bzip2/lib && test -d /usr/local/opt/bzip2/include
    fish_add_path /usr/local/opt/bzip2/bin
    set -xg LDFLAGS -L/usr/local/opt/bzip2/lib
    set -xg CPPFLAGS -I/usr/local/opt/bzip2/include
end