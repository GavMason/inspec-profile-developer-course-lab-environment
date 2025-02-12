control "V-230535" do
  title "RHEL 8 must prevent IPv6 Internet Control Message Protocol (ICMP) redirect messages from 
being accepted."
  desc "ICMP redirect messages are used by routers to inform hosts that a more direct route exists for a 
particular destination. These messages modify the host's route table and are 
unauthenticated. An illicit ICMP redirect message could result in a man-in-the-middle 
attack.

The sysctl --system command will load settings from all system configuration 
files. All configuration files are sorted by their filename in lexicographic order, 
regardless of which of the directories they reside in. If multiple files specify the same 
option, the entry in the file with the lexicographically latest name will take precedence. 
Files are read from directories in the following list from top to bottom. Once a file of a given 
filename is loaded, any file of the same name in subsequent directories is ignored.
/etc/sysctl.d/*.conf
/run/sysctl.d/*.conf
/usr/local/lib/sysctl.d/*.conf
/usr/lib/sysctl.d/*.conf
/lib/sysctl.d/*.conf
/etc/sysctl.conf"
  desc "check", "Verify RHEL 8 will not accept IPv6 ICMP redirect messages.

Note: If IPv6 is disabled on the 
system, this requirement is Not Applicable.

Check the value of the default 
\"accept_redirects\" variables with the following command:

$ sudo sysctl 
net.ipv6.conf.default.accept_redirects

net.ipv6.conf.default.accept_redirects = 
0

If the returned line does not have a value of \"0\", a line is not returned, or the line is 
commented out, this is a finding.

Check that the configuration files are present to enable 
this network parameter.

$ sudo grep -r net.ipv6.conf.default.accept_redirects 
/run/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf 
/lib/sysctl.d/*.conf /etc/sysctl.conf 
/etc/sysctl.d/*.conf

/etc/sysctl.d/99-sysctl.conf: 
net.ipv6.conf.default.accept_redirects = 0

If 
\"net.ipv6.conf.default.accept_redirects\" is not set to \"0\", is missing or commented out, 
this is a finding.

If results are returned from more than one file location, this is a 
finding."
  desc "fix", "Configure RHEL 8 to prevent IPv6 ICMP redirect messages from being accepted.

Add or edit the 
following line in a system configuration file, in the \"/etc/sysctl.d/\" 
directory:

net.ipv6.conf.default.accept_redirects = 0

Load settings from all system 
configuration files with the following command:

$ sudo sysctl --system"
  impact 0.5
  tag severity: "medium"
  tag gtitle: "SRG-OS-000480-GPOS-00227"
  tag gid: "V-230535"
  tag rid: "SV-230535r818848_rule"
  tag stig_id: "RHEL-08-040210"
  tag fix_id: "F-33179r818847_fix"
  tag cci: ["CCI-000366"]
  tag nist: ["CM-6 b"]
end