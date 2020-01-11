# ansible-ubuntu-workstation

A set of scripts and playbooks for maintaining consistent Ubuntu workstations.

## create-ansible-user.sh

Creates a user named ansible with a random password.

It assumes that a file, "ansible-user.pub", exists in your current working directory.

Below is an example of generating this file:

```bash
ssh-keygen -t rsa -b 4096 -C "ansible@example.com" -f ansible-user -q -N ""
```

That key will be used for configuring passwordless SSH logins.

This should be ran on all systems that will be maintained by Ansible.

This will also add a line to the `/etc/sudoers` file that allows for passwordless sudo.

You can access this user utilizing sudo:

```bash
sudo -u ansible -i
```

## setup-ansible.sh

Installs Ansible.

This only needs to be ran on the system you will be running Ansible from.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details