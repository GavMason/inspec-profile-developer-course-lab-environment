control "V-230317" do
  title "Executable search paths within the initialization files of all local interactive RHEL 8 
users must only contain paths that resolve to the system default or the users home directory."
  desc "The executable search path (typically the PATH environment variable) contains a list of 
directories for the shell to search to find executables. If this path includes the current 
working directory (other than the user's home directory), executables in these directories 
may be executed instead of system commands. This variable is formatted as a colon-separated 
list of directories. If there is an empty entry, such as a leading or trailing colon or two 
consecutive colons, this is interpreted as the current working directory. If deviations 
from the default system search path for the local interactive user are required, they must be 
documented with the Information System Security Officer (ISSO)."
  desc "check", "Verify that all local interactive user initialization file executable search path 
statements do not contain statements that will reference a working directory other than user 
home directories with the following commands:

$ sudo grep -i path= /home/*/.*

/home/[localinteractiveuser]/.bash_profile:PATH=$PATH:$HOME/.local/bin:$HOME/bin

If 
any local interactive user initialization files have executable search path statements 
that include directories outside of their home directory and is not documented with the ISSO 
as an operational requirement, this is a finding."
  desc "fix", "Edit the local interactive user initialization files to change any PATH variable statements 
that reference directories other than their home directory.

If a local interactive user 
requires path variables to reference a directory owned by the application, it must be 
documented with the ISSO."
  impact 0.5
  tag severity: "medium"
  tag gtitle: "SRG-OS-000480-GPOS-00227"
  tag gid: "V-230317"
  tag rid: "SV-230317r792896_rule"
  tag stig_id: "RHEL-08-010690"
  tag fix_id: "F-32961r567698_fix"
  tag cci: ["CCI-000366"]
  tag nist: ["CM-6 b"]
end