import subprocess

print("Finding sdk package updates...")
command = 'bash -c "export SDKMAN_DIR=\"$HOME/.sdkman\"; [[ -s \"$HOME/.sdkman/bin/sdkman-init.sh\" ]]; source \"$HOME/.sdkman/bin/sdkman-init.sh\"; sdk list java"'
output = str(subprocess.check_output(command, shell=True)).split("\\n")
versions = [("21", "graal "), ("8", "tem")]
found = []
for line in output:
    if len(versions) == 0:
        break
    if versions[0][0] in line and versions[0][1] in line:
        if "installed" not in line:
            found.append(line)
        versions.pop(0)
if len(found) > 0:
    print("\n".join(found))
else:
    print("Nothing found.")
