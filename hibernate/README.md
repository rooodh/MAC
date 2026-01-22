# Hibernate App for macOS

A simple macOS application to manage hibernation mode with one click.

## Features

- **Enable Hibernate Mode**: Put your Mac in hibernation mode (saves state to disk)
- **Disable Hibernate Mode**: Return to regular sleep mode
- **Put to Sleep Now**: Immediately put your Mac to sleep using the current mode

## How it works

This application uses macOS's `pmset` command to control hibernation settings:

- **Hibernation Mode (25)**: Saves the entire system state to disk and powers off
- **Regular Sleep Mode (0)**: Keeps power to RAM for faster wake

## Requirements

- macOS 12.0 or later
- Xcode 13.0 or later to build
- Administrator privileges (for changing hibernation settings)

## Installation

### Option 1: Build from source

1. Open the `HibernateApp.xcodeproj` in Xcode
2. Build and run the application
3. The app will be installed in your Applications folder

### Option 2: Use the shell script

If you prefer a command-line approach, you can use the included shell script:

```bash
# Make the script executable
chmod +x hibernate.sh

# Enable hibernation mode (requires sudo)
sudo ./hibernate.sh enable

# Disable hibernation mode (requires sudo)
sudo ./hibernate.sh disable

# Put Mac to sleep immediately
./hibernate.sh sleep
```

## Usage

### Using the GUI App

1. Launch the Hibernate App
2. Click "Enable Hibernate Mode" to activate hibernation
3. Click "Put to Sleep Now" to immediately hibernate your Mac
4. When you want regular sleep again, click "Disable Hibernate Mode"

### Using the Command Line Script

If you prefer to use the command line, you can use the included script:

```bash
# Make the script executable
chmod +x execute_with_sudo.sh

# Enable hibernation mode
./execute_with_sudo.sh pmset -a hibernatemode 25

# Disable hibernation mode
./execute_with_sudo.sh pmset -a hibernatemode 0
```

The script will prompt you for your password and execute the command with sudo privileges.

## Notes

- The app requires administrator privileges to change hibernation settings
- Hibernation mode (25) combines both sleep and hibernation for best results
- Your Mac will wake up exactly as you left it, regardless of the sleep mode

## Troubleshooting

If you encounter issues:

1. Make sure you have administrator privileges
2. Check that your Mac supports hibernation mode
3. Verify that you have enough free disk space for hibernation

## License

This project is open source and available under the MIT License.
