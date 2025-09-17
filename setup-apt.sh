#!/bin/bash
clear
echo "[ Debian 10 Archive Setup Script ]"
echo

# Function to print colored output
print_success() {
    echo -e "\033[32m✓ $1\033[0m"
}

print_error() {
    echo -e "\033[31m✗ $1\033[0m"
}

print_info() {
    echo -e "\033[34mℹ $1\033[0m"
}

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   print_error "This script must be run as root"
   exit 1
fi

print_info "Starting Debian 10 archive repository setup..."

# Backup existing sources.list
print_info "Creating backup of existing sources.list..."
if cp /etc/apt/sources.list /etc/apt/sources.list.backup 2>/dev/null; then
    print_success "Backup created successfully"
else
    print_error "Failed to create backup"
    exit 1
fi

# Create new sources.list with archived Debian 10 repositories
print_info "Creating new sources.list with archive repositories..."
if tee /etc/apt/sources.list > /dev/null <<EOF
deb http://archive.debian.org/debian buster main contrib non-free
deb http://archive.debian.org/debian-security buster/updates main contrib non-free
deb http://archive.debian.org/debian buster-backports main contrib non-free
EOF
then
    print_success "New sources.list created successfully"
else
    print_error "Failed to create new sources.list"
    exit 1
fi

# Validate the sources.list content
print_info "Validating sources.list content..."
if grep -q "archive.debian.org" /etc/apt/sources.list; then
    print_success "Archive repositories correctly configured"
else
    print_error "Archive repositories not found in sources.list"
    print_info "Restoring backup..."
    cp /etc/apt/sources.list.backup /etc/apt/sources.list
    exit 1
fi
echo
print_success "Debian 10 archive setup completed successfully!"
echo "Backup saved as: /etc/apt/sources.list.backup"
