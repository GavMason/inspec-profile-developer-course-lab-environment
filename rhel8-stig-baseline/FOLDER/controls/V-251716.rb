control "V-251716" do
  title "RHEL 8 systems, version 8.4 and above, must ensure the password complexity module is 
configured for three retries or less."
  desc "Use of a complex password helps to increase the time and resources required to compromise the 
password. Password complexity, or strength, is a measure of the effectiveness of a password 
in resisting attempts at guessing and brute-force attacks. \"pwquality\" enforces complex 
password construction configuration and has the ability to limit brute-force attacks on the 
system.

RHEL 8 utilizes \"pwquality\" as a mechanism to enforce password complexity. This is 
set in both:
/etc/pam.d/password-auth
/etc/pam.d/system-auth
By limiting the number 
of attempts to meet the pwquality module complexity requirements before returning with an 
error, the system will audit abnormal attempts at password changes."
  desc "check", "Note: This requirement applies to RHEL versions 8.4 or newer. If the system is RHEL below 
version 8.4, this requirement is not applicable.

Verify the operating system is 
configured to limit the \"pwquality\" retry option to 3. 

Check for the use of the \"pwquality\" 
retry option with the following command:

$ sudo grep retry 
/etc/security/pwquality.conf

retry = 3

If the value of \"retry\" is set to \"0\" or greater 
than \"3\", is commented out or missing, this is a finding.

Check for the use of the \"pwquality\" 
retry option in the system-auth and password-auth files with the following command:

$ sudo 
grep retry /etc/pam.d/system-auth /etc/pam.d/password-auth

If the command returns any 
results, this is a finding."
  desc "fix", "Configure the operating system to limit the \"pwquality\" retry option to 3.

Add the 
following line to the \"/etc/security/pwquality.conf\" file(or modify the line to have the 
required value):

retry = 3"
  impact 0.5
  tag severity: "medium"
  tag gtitle: "SRG-OS-000480-GPOS-00227"
  tag gid: "V-251716"
  tag rid: "SV-251716r809372_rule"
  tag stig_id: "RHEL-08-020104"
  tag fix_id: "F-55107r809371_fix"
  tag cci: ["CCI-000366"]
  tag nist: ["CM-6 b"]
end