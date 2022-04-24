from subprocess import CalledProcessError, run


def install_packages(packages):
    """
    Installs a given arch package for the project.

    :param packages: The packages to install.
    :type packages: list

    :return: Was installation successful?
    :rtype: bool
    """

    # Install packages
    try:
        for package in packages:
            run(["sudo", "pacman", "-S", package], check=True)
    except CalledProcessError:
        return False
    return True


def install_zsh_plugin(plugin_url, plugin_name):
    """
    Installs a given zsh plugin.

    :param plugin_url: The url to the plugin.
    :type plugin_url: str
    :param plugin_name: The name of the plugin.
    :type plugin_name: str

    :return: Was installation successful?
    :rtype: bool
    """

    # Install plugin
    try:
        run([
            "git", "clone", plugin_url,
            "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/" + plugin_name],
            check=True)
    except CalledProcessError:
        return False
    return True


def install_dependencies():
    """
    Installs all of the necessary dependencies for the project.

    :return: was installation successful
    :rtype: bool
    """

    # Install dependencies
    print("Installing all of the programs...\n\n")
    if not install_packages([
        "lightdm",
        "lightdm-webkit2-greeter",
        "lightdm-webkit-theme-aether",
        "nushell",
        "starship",
        "vifm",
        "wezterm",
        "zsh"
    ]):
        return False

    # Install oh my zsh
    print("Installing oh my zsh...\n\n")
    try:
        run(["sh", "-c", "\"$(wget",
            "https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh",
             "-O", "-", ")\""], check=True)
    except CalledProcessError:
        return False

    # Install zsh plugins
    print("Installing zsh plugins...\n\n")
    for plugin in ("zsh-autosuggestions", "zsh-syntax-highlighting"):
        if not install_zsh_plugin(
                f"https://github.com/zsh-users/{plugin}", plugin):
            return False

    # Install packer.nvim
    print("Installing packer.nvim...\n\n")
    try:
        run(["git", "clone", "--depth", "1",
            "https://github.com/wbthomason/packer.nvim",
             "~/.local/share/nvim/site/pack/packer/start/packer.nvim"],
            check=True)
    except CalledProcessError:
        return False

    # If all works, return True
    return True


def setup_dotfiles():
    """
    Sets up the dotfiles for the project.

    :return: was setup successful
    :rtype: bool
    """

    # Replace most dotfiles
    print("Replacing dotfiles...\n\n")

    try:
        run(["sudo", "rm", "/etc/lightdm/lightdm.conf",
            "/etc/lightdm/lightdm-webkit2-greeter.conf"], check=True)
        run(["sudo", "cp", "./lightdm/*", "/etc/lightdm/"], check=True)

        run(["mkdir", "-p", "~/.config/"], check=True)

        run(["rm", "-rf", "~/.config/nushell/"], check=False)
        run(["cp", "-r", "./nushell/", ".config/"], check=True)

        run(["rm", "-rf", "~/.config/starship/"], check=False)
        run(["cp", "-r", "./starship/", ".config/"], check=True)

        run(["rm", "-rf", "~/.config/vifm/"], check=False)
        run(["cp", "-r", "./vifm/", ".config/"], check=True)

        run(["rm", "-rf", "~/.config/wezterm/"], check=False)
        run(["cp", "-r", "./wezterm/", ".config/"], check=True)

        run(["rm", "~/.zshrc"], check=False)
        run(["cp", "./zsh/zshrc", "~/.zshrc"], check=True)

        run(["rm", "-rf", "~/.config/nvim/*"], check=False)
        run(["mkdir", "~/.config/nvim/"], check=True)
        run(["cp", "./nvim/init-pluginonly.lua", "~/.config/nvim/init.lua"],
            check=True)
        print(
            "Please type ':qa' and then enter once packer.nvim finishes.")
        run(["nvim", "-c", "\":PackerSync\""], check=True)
        run(["rm", "~/.config/nvim/init.lua"], check=True)
        run(["cp", "./nvim/init.lua", "~/.config/nvim/"], check=True)

        run(["chsh", "-s", "/usr/bin/nu"], check=True)
    except CalledProcessError:
        return False

    # If all works, return True
    return True


def main():
    """
    Main function.
    """

    # Install dependencies
    if not install_dependencies():
        print("Installation failed.")
        return

    # Setup dotfiles
    if not setup_dotfiles():
        print("Setup failed.")
        return

    # If all works, print success
    print("Setup complete. Please reboot immediately.")


if __name__ == "__main__":
    main()
