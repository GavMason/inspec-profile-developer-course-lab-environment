control "V-230437" do
  title "Successful/unsuccessful uses of the newgrp command in RHEL 8 must generate an audit record."
  desc "Without generating audit records that are specific to the security and mission needs of the 
organization, it would be difficult to establish, correlate, and investigate the events 
relating to an incident or identify those responsible for one.

Audit records can be 
generated from various components within the information system (e.g., module or policy 
filter). The \"newgrp\" command is used to change the current group ID during a login 
session.

When a user logs on, the AUID is set to the UID of the account that is being 
authenticated. Daemons are not user sessions and have the loginuid set to \"-1\". The AUID 
representation is an unsigned 32-bit integer, which equals \"4294967295\". The audit system 
interprets \"-1\", \"4294967295\", and \"unset\" in the same way."
  desc "check", "Verify RHEL 8 generates an audit record when successful/unsuccessful attempts to use the 
\"newgrp\" command by performing the following command to check the file system rules in 
\"/etc/audit/audit.rules\":

$ sudo grep -w newgrp /etc/audit/audit.rules

-a 
always,exit -F path=/usr/bin/newgrp -F perm=x -F auid&gt;=1000 -F auid!=unset -k 
priv_cmd

If the command does not return a line, or the line is commented out, this is a 
finding."
  desc "fix", "Configure the audit system to generate an audit event for any successful/unsuccessful use of 
the \"newgrp\" command by adding or updating the following rule in the 
\"/etc/audit/rules.d/audit.rules\" file:

-a always,exit -F path=/usr/bin/newgrp -F 
perm=x -F auid&gt;=1000 -F auid!=unset -k priv_cmd

The audit daemon must be restarted for 
the changes to take effect."
  impact 0.5
  tag severity: "medium"
  tag gtitle: "SRG-OS-000062-GPOS-00031"
  tag satisfies: ["SRG-OS-000062-GPOS-00031","SRG-OS-000037-GPOS-00015","SRG-OS-000042-GPOS-00020","SRG-OS-000062-GPOS-00031","SRG-OS-000392-GPOS-00172","SRG-OS-000462-GPOS-00206","SRG-OS-000471-GPOS-00215"]
  tag gid: "V-230437"
  tag rid: "SV-230437r627750_rule"
  tag stig_id: "RHEL-08-030350"
  tag fix_id: "F-33081r568058_fix"
  tag cci: ["CCI-000169"]
  tag nist: ["AU-12 a"]
end