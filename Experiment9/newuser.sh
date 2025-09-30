#!/bin/bash


read -p "Enter new username: " username

if id "$username" &>/dev/null; then
	echo "Error: User '$username' already exists."
	exit 1
fi

sudo useradd -m "$username"

sudo chmod 700 /home/"$username"

sudo passwd "$username"

echo "User '$username' created successfully with home directory /home/$username amd default permissions700."
