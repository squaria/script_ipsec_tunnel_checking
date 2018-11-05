#!/bin/bash
for (( ; ; )) # Infinite loop
do
        test=$(/usr/sbin/ipsec status | grep -e "ESTABLISHED" | wc -l) # Check if, in the status, "ESTABLISHED" is here"

        if [[ "$test" -eq "1" ]] # "wc -l" return 1 if the grep is true and 0 if he's false.
                then
                        echo "Tunnel opened" 
                else
                        echo "tunnel closed reup"
                        /usr/sbin/ipsec up name_of_the_tunnel
                        sleep 8s
                        last=$(journalctl --unit=tunnel_is_down.service -n 1 --no-pager | grep -e "connection 'name_of_the_tunnel' established successfully" | wc -l) # grep the last line of the service's journal and verify if ipsec (strongswan) is started. If not, the last is "tunnel closed reup" because "ipsec up name_of_the_tunnel" return nothing as long as ipsec is not started.
                                if [[ "$last" -eq "0" ]]
                                        then
                                                echo "Strongswan is shutdown, restart"
                                                /usr/sbin/ipsec restart
                                        else
                                                echo "No problem"
                                fi
        fi
        sleep 60s
done

