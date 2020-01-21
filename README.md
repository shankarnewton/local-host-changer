# About the tool
This is a small cli based script for local developers to manually add a hostname to the "hosts" file situated under C:\Windows\System32\drivers\etc and "httpd-vhosts.conf" file situated under "C:\xamp\apache\conf\extra"

During each execution, a backup of hosts and httpd-vhosts.conf is created in a local directory as a safe point incase if you wish to roll back.

# Configuration
1. Simply clone the repo
2. Change your backup location at line 18 (or Leave it as it is if you're ok with backup at C drive)
3. Change your apache config path at Line 28, by default it is S:\xamp\apache\conf\extra\httpd-vhosts.conf
all done!

# Support
You may open an issue ticket if you feel something is not good.
