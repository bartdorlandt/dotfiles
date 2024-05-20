if test -e /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
    if test -e "$(brew --prefix)/var/run/yubikey-agent.sock"
        set -gx SSH_AUTH_SOCK (brew --prefix)/var/run/yubikey-agent.sock
    end
    if test -d (brew --prefix openssh)/bin
        fish_add_path (brew --prefix openssh)/bin
    end
end

# compiler bzip2
if test -d /opt/homebrew/opt/bzip2/bin && test -d /opt/homebrew/opt/bzip2/lib && test -d /opt/homebrew/opt/bzip2/include
    fish_add_path /usr/local/opt/bzip2/bin
    set -xg LDFLAGS -L/usr/local/opt/bzip2/lib
    set -xg CPPFLAGS -I/usr/local/opt/bzip2/include
end
# compiler zlib
if test -d /opt/homebrew/opt/zlib/lib && test -d /opt/homebrew/opt/zlib/include
    set -xg LDFLAGS -L/usr/local/opt/zlib/lib
    set -xg CPPFLAGS -I/usr/local/opt/zlib/include
end
