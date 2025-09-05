echo "Setting up ssh in $HOME/.ssh"
mkdir -p "$HOME/.ssh"

KEYFILE="$HOME/.ssh/id_ed25519"

if [ -f $KEYFILE ]; then
    echo "Skipping ssh key generation"
else
    echo "Generating ssh key"
    ssh-keygen -t ed25519 -f "$KEYFILE" -N "" -q
    echo "Done"
fi

CONFIG_FILE="$HOME/.ssh/config"
echo "Creating ssh config file"
touch "$CONFIG_FILE"
chmod 600 "$CONFIG_FILE"
echo "Done"

while true; do
    read -rp "Do you want to set up config for an SSH server? (y/n): " yn
    case "$yn" in
        [Yy]* )
            read -rp "Enter nickname (e.g. myserver): " NICK
            read -rp "Enter domain or IP: " HOSTNAME
            read -rp "Enter SSH username: " USERNAME

            # Check if nickname already exists
            if grep -q "Host $NICK" "$CONFIG_FILE"; then
                echo "❌ Host '$NICK' already exists in $CONFIG_FILE"
                continue
            fi

            # Append new host block
            cat >> "$CONFIG_FILE" <<EOF

Host $NICK
    HostName $HOSTNAME
    User $USERNAME
    IdentityFile $KEYFILE
EOF

            echo "✅ Added host '$NICK' to $CONFIG_FILE"

            echo "Copying SSH key to $USERNAME@$HOSTNAME..."
            ssh-copy-id -i "$KEYFILE.pub" "$USERNAME@$HOSTNAME"

            echo "✅ Server added! You can now connect with: ssh $NICK"
            ;;
        [Nn]* )
            echo "✅ Done with ssh setup"
            break
            ;;
        * )
            echo "Please answer y or n."
            ;;
    esac
done

