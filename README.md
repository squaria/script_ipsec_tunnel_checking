# script_ipsec_tunnel_checking
Script to check if a ipsec tunnel (Strongswan) is up and running for high availability tunnel. All explanations of how it works are in the script comments.

Move tunnel_is_down.service into /etc/systemd/system/ and

<code>sudo chown root:root /etc/systemd/system/tunnel_is_down.service</code>

<code>sudo systemctl enable tunnel_is_down.service</code>

Then move tunnel_is_down.sh into /opt/ and

<code>sudo chown root:root /opt/tunnel_is_down.sh</code>

<code>sudo chmod +x /opt/tunnel_is_down.sh</code>

Change "name_of_the_tunnel" to the name of your tunnel in tunnel_is_down.sh file.

And finally, run the service with :

<code>sudo service tunnel_is_down start</code>

PS: I'm a beginner, I know this script is ugly but don't hesitate to tell me how to improve it and sorry for this horrible english ^^.
