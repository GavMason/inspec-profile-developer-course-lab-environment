control "V-230356" do
  title "RHEL 8 must ensure the password complexity module is enabled in the password-auth file."
  desc "Use of a complex password helps to increase the time and resources required to compromise the 
password. Password complexity, or strength, is a measure of the effectiveness of a password 
in resisting attempts at guessing and brute-force attacks. \"pwquality\" enforces complex 
password construction configuration and has the ability to limit brute-force attacks on the 
system.

RHEL 8 utilizes \"pwquality\" as a mechanism to enforce password complexity. This is 
set in both:
/etc/pam.d/password-auth
/etc/pam.d/system-auth"
  desc "check", "Verify the operating system uses \"pwquality\" to enforce the password complexity rules. 


Check for the use of \"pwquality\" in the password-auth file with the following command:

$ 
sudo cat /etc/pam.d/password-auth | grep pam_pwquality

password required 
pam_pwquality.so 

If the command does not return a line containing the value 
\"pam_pwquality.so\", or the line is commented out, this is a finding."
  desc "fix", "Configure the operating system to use \"pwquality\" to enforce password complexity 
rules.

Add the following line to the \"/etc/pam.d/password-auth\" file (or modify the line 
to have the required value):

password required pam_pwquality.so"
  impact 0.5
  tag severity: "medium"
  tag gtitle: "SRG-OS-000069-GPOS-00037"
  tag gid: "V-230356"
  tag rid: "SV-230356r809379_rule"
  tag stig_id: "RHEL-08-020100"
  tag fix_id: "F-33000r809286_fix"
  tag cci: ["CCI-000366"]
  tag nist: ["CM-6 b"]
end