control "V-237642" do
  title "RHEL 8 must use the invoking user's password for privilege escalation when using \"sudo\"."
  desc "The sudoers security policy requires that users authenticate themselves before they can use 
sudo. When sudoers requires authentication, it validates the invoking user's credentials. 
If the rootpw, targetpw, or runaspw flags are defined and not disabled, by default the 
operating system will prompt the invoking user for the \"root\" user password. 
For more 
information on each of the listed configurations, reference the sudoers(5) manual page."
  desc "check", "Verify that the sudoers security policy is configured to use the invoking user's password for 
privilege escalation.

$ sudo egrep -i '(!rootpw|!targetpw|!runaspw)' /etc/sudoers 
/etc/sudoers.d/* | grep -v '#'

/etc/sudoers:Defaults 
!targetpw
/etc/sudoers:Defaults !rootpw
/etc/sudoers:Defaults !runaspw

If no 
results are returned, this is a finding.
If results are returned from more than one file 
location, this is a finding.
If \"Defaults !targetpw\" is not defined, this is a finding.
If 
\"Defaults !rootpw\" is not defined, this is a finding.
If \"Defaults !runaspw\" is not defined, 
this is a finding."
  desc "fix", "Define the following in the Defaults section of the /etc/sudoers file or a configuration file 
in the /etc/sudoers.d/ directory:
Defaults !targetpw
Defaults !rootpw
Defaults 
!runaspw"
  impact 0.5
  tag severity: "medium"
  tag gtitle: "SRG-OS-000480-GPOS-00227"
  tag gid: "V-237642"
  tag rid: "SV-237642r809326_rule"
  tag stig_id: "RHEL-08-010383"
  tag fix_id: "F-40824r646895_fix"
  tag cci: ["CCI-002227"]
  tag nist: ["AC-6 (5)"]
end