set -eux

# this configuration allows the initial user account to sudo su - without needing a password

# Install sudo
apk add sudo shadow

# allow sudo without password
echo "christian  ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

# allows ssh login without the user being locked
# https://unix.stackexchange.com/questions/193066/how-to-unlock-account-for-public-key-ssh-authorization-but-not-for-password-aut
usermod -p '*' christian

# the root user is also being blocked from ssh login in sshd_config
# remove root password (optional - makes it impossible to login as root from console)
#usermod -p '*' root

# lock root account
#passwd -l root
