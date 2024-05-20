abbr --add myipext curl ifconfig.co
abbr --add myipext4 curl -4 ifconfig.co
abbr --add myipext6 curl -6 ifconfig.co
# ip --color > /dev/null 2>&1 && IPCOLOR=--color
abbr --add ip ip $IPCOLOR
abbr --add ipb ip $IPCOLOR --brief
abbr --add ip4 ip -4 $IPCOLOR --brief addr | grep -v UNKNOWN
abbr --add ip6 ip -6 $IPCOLOR --brief addr | grep -v UNKNOWN
