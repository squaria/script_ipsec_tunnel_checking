# script_ipsec_tunnel_checking
Script to check if a ipsec tunnel (Strongswan) is up and running for high availability tunnel. All explanations of how it works are in the script comments.

Move nordvpn_is_down.service into /etc/systemd/system/ and
<code>sudo chown root:root /etc/systemd/system/nordvpn_is_down.service
sudo systemctl enable nordvpn_is_down.service</code>

Then move nordvpn_is_down.sh into /opt/ and
<code>sudo chown root:root /opt/nordvpn_is_down.sh
sudo chmod +x /opt/nordvpn_is_down.sh</code>
Change "name_of_the_tunnel" to the name of your tunnel in nordvpn_is_down.sh file.

And finally, run the service with
<code>sudo service nordvpn_is_down start</code>

PS: I'm a beginner, I know this script is ugly but don't hesitate to tell me how to improve it and sorry for this horrible english ^^.
