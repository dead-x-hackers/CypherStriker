clear

echo -e "\e[1;32m"
figlet "CypherStriker"
echo -e "\e0"
echo -e "\e0"
echo -e "\e0"
install_package() {
    package_name="$1"
    install_command="$2"
    max_progress=100
    progress=0

    ($install_command $package_name >/dev/null 2>&1) &
    install_pid=$!

    while ps -p $install_pid >/dev/null && [ $progress -lt $max_progress ]; do
        percentage=$((progress * 100 / max_progress))
        echo -ne "\r\e[1;32m[ + ] Installing $package_name... : $percentage%\e[0m"
        ((progress += 1))
        sleep 0.13
    done

    wait $install_pid
    echo -e "\r\e[1;32m[ + ] $package_name installed successfully\e[0m"
}
# Detect the operating system
if [ -f /data/data/com.termux/files/usr/bin/uname ]; then
    OS="termux"
elif [ -f /etc/os-release ]; then
    source /etc/os-release
    OS="$ID"
else
    echo -e "\e[1;31m[ ! ] Operating system detection failed. CypherStriker requires an operating system that supports /etc/os-release or Termux. Exiting...\e[0m"
    exit 1
fi

echo "==================================================================="
echo -e "\e[1;33m|_________Installing dependencies for CypherStriker________________|"
echo -e "\e[1;32m"
echo "  【 〄 】  Author: David X HuiHola"
echo "  【 〄 】  Team: Dead x Hackers"
echo "  【 〄 】  Yt: Dead x Hackers"
echo "  【 〄 】  Tg:t.me/BO2N2H4CK"
echo "  【 〄 】  Thank you very much for using our tool. Enjoy your enhanced Hacking  journey with CypherStriker!"
echo -e "\033[33;1m"
echo "______________________________________________________"
echo -e "======================================================"
echo -e "\e[1;33m──────────────────────────────────────────────────────"
echo -e "\e[1;32m[ - ] Detected operating system: $OS\e[0m"
echo -e "\e[1;32m[ - ] Checking dependencies for CypherStriker...\e0"
echo -e "\e[1;33m──────────────────────────────────────────────────────"
echo -e "======================================================"

# Install dependencies based on the detected operating system
case "$OS" in
    "ubuntu")
        PACKAGE_NAMES=("python3" "nodejs" "default-jdk" "figlet" "apktool")
        INSTALL_COMMANDS=("sudo apt-get install -y" "sudo apt-get install -y" "sudo apt-get install -y" "sudo apt-get install -y" "sudo apt-get install -y")

        sleep 2
        INSTALLED_PACKAGES=0
        for ((i = 0; i < ${#PACKAGE_NAMES[@]}; i++)); do
            if dpkg -s "${PACKAGE_NAMES[i]}" >/dev/null 2>&1; then
                echo -e "\e[1;32m[ + ] ${PACKAGE_NAMES[i]} is already installed\e[0m"
            else
                echo -e "\e[31m[ - ] ${PACKAGE_NAMES[i]} is not installed\e[0m"
                install_package "${PACKAGE_NAMES[i]}" "${INSTALL_COMMANDS[i]}"
                if [ $? -eq 0 ]; then  # Corrected condition to check for success
                    INSTALLED_PACKAGES=$((INSTALLED_PACKAGES + 1))
                fi
            fi
            sleep 1
        done

        if [ $INSTALLED_PACKAGES -eq 0 ]; then
            sleep 1
            echo -e "\e[1;32m[ + ] All dependencies are installed\e[0m"
            echo -e "\033[33;1m======================================================\e[0m"
        else
            echo -e "\e[1;32m[ + ] Installed package $INSTALLED_PACKAGES \e[0m"
            echo -e "\e[1;32m[ + ] All dependencies installed successfully\e[0m"
            echo -e "\033[33;1m======================================================\e[0m"
        fi
        ;;

"kali")
        PACKAGE_NAMES=("python3" "nodejs" "default-jdk" "figlet" "openssh-server")
        INSTALL_COMMANDS=("sudo apt-get install -y" "sudo apt-get install -y" "sudo apt-get install -y" "sudo apt-get install -y" "sudo apt-get install -y")

        sleep 2
        INSTALLED_PACKAGES=0
        for ((i = 0; i < ${#PACKAGE_NAMES[@]}; i++)); do
            if dpkg -s "${PACKAGE_NAMES[i]}" >/dev/null 2>&1; then
                echo -e "\e[1;32m[ + ] ${PACKAGE_NAMES[i]} is already installed\e[0m"
            else
                echo -e "\e[31m[ - ] ${PACKAGE_NAMES[i]} is not installed\e[0m"
                install_package "${PACKAGE_NAMES[i]}" "${INSTALL_COMMANDS[i]}"
                if [ $? -eq 0 ]; then  # Corrected condition to check for success
                    INSTALLED_PACKAGES=$((INSTALLED_PACKAGES + 1))
                fi
            fi
            sleep 1
        done

        if [ $INSTALLED_PACKAGES -eq 0 ]; then
            sleep 1
            echo -e "\e[1;32m[ + ] All dependencies are installed\e[0m"
            echo -e "\033[33;1m======================================================\e[0m"
        else
            echo -e "\e[1;32m[ + ] Installed package $INSTALLED_PACKAGES \e[0m"
            echo -e "\e[1;32m[ + ] All dependencies installed successfully\e[0m"
            echo -e "\033[33;1m======================================================\e[0m"
        fi
        ;;

    "termux")
        PACKAGE_NAMES=("python" "nodejs" "openjdk-17" "figlet" "openssh")
        INSTALL_COMMANDS=("pkg install -y" "pkg install -y" "pkg install -y" "pkg install -y" "pkg install -y")

        sleep 2
        INSTALLED_PACKAGES=0
        for ((i = 0; i < ${#PACKAGE_NAMES[@]}; i++)); do
            if dpkg -s "${PACKAGE_NAMES[i]}" >/dev/null 2>&1; then
                echo -e "\e[1;32m[ + ] ${PACKAGE_NAMES[i]} is already installed\e[0m"
            else
                echo -e "\e[31m[ - ] ${PACKAGE_NAMES[i]} is not installed\e[0m"
                install_package "${PACKAGE_NAMES[i]}" "${INSTALL_COMMANDS[i]}"
                if [ $? -eq 0 ]; then
                    INSTALLED_PACKAGES=$((INSTALLED_PACKAGES + 1))
                fi
            fi
            sleep 1
        done

        if [ $INSTALLED_PACKAGES -eq 0 ]; then
            sleep 1
            echo -e "\e[1;32m[ + ] All dependencies are installed\e[0m"
            echo -e "\033[33;1m======================================================\e[0m"
        else
            sleep 1
            echo -e "\e[1;32m[ + ] Installed package $INSTALLED_PACKAGES \e[0m"
            sleep 1
            echo -e "\e[1;32m[ + ] All dependencies installed successfully\e[0m"
            echo -e "\033[33;1m======================================================\e[0m"
        fi
        ;;
esac
