## sysopctl: System Operations CLI Tool

`sysopctl` is a custom command-line interface (CLI) tool designed to simplify common system administration tasks such as managing services, monitoring system load, checking disk usage, and more. It provides user-friendly commands that are aliases for common system commands like `systemctl`, `df`, and `uptime`.

## Features

-   List active services, view system load, and check disk usage.
-   Start and stop system services easily.
-   Monitor real-time processes and analyze system logs.
-   Perform file backups using the built-in `backup` command.
-   Includes helpful options like `--help` and `--version` for quick reference.

## Table of Contents

1.  [Installation](#installation)
2.  [Usage](#usage)
3.  [Commands](#commands)
4.  [Options](#options)
5.  [Setting up Manual Page](#creating-a-manual-page)
6.  [Troubleshooting](#troubleshooting)

---

## Installation

To install `sysopctl` for system-wide use, follow these steps:

### 1\. Clone or Download the Script

Download the `sysopctl` script and make it executable:

```bash
chmod +x sysopctl
```

### 2\. Move the Script to a Directory in Your `$PATH`

To make the script accessible from anywhere in the system, copy it to `/usr/local/bin`:

```bash
sudo cp sysopctl /usr/local/bin/
```

### 3\. Verify Installation

After copying the script, you can verify that it's installed correctly by running:
```bash
sysopctl --help
```

---

## Usage

The `sysopctl` tool provides easy-to-remember commands to manage and monitor various aspects of the system.

Basic usage:

```bash
sysopctl <command> [options]
```

For example, to list active services:

```bash
sysopctl service list
```

---

## Commands

### Part 1 | Easy Level

#### 1\. List Running Services

```bash
sysopctl service list
```

Displays a list of all active services, similar to `systemctl list-units --type=service --state=running`.

#### 2\. View System Load

```bash
sysopctl system load
```

Shows the current system load averages, similar to the `uptime` command.

---

### Part 2 | Intermediate Level

#### 3\. Start a Service

```bash
sysopctl service start [service-name]
```

Starts a system service, similar to `systemctl start <service-name>`.

#### 4\. Stop a Service

```bash
sysopctl service stop [service-name]
```

Stops a system service, similar to `systemctl stop <service-name>`.

#### 5\. Check Disk Usage

```bash
sysopctl disk usage
```

Displays disk usage statistics by partition, similar to the `df -h` command.

---

### Part 3 | Advanced Level

#### 6\. Monitor System Processes

```bash
sysopctl process monitor
```

Monitors real-time process activity, similar to `top`.

#### 7\. Analyze System Logs

```bash
sysopctl logs analyze
```

Summarizes recent critical log entries using `journalctl -p 3 -b`.

#### 8\. Backup System Files

```bash
sysopctl backup [path]
```

Backs up files from the specified `<path>` to a destination, typically using `rsync`.

---

## Options

### 1\. Display Help

```bash
sysopctl --help
```

Shows the help message, listing all available commands, options, and usage examples.

### 2\. Display Version

```bash
sysopctl --version
```

Displays the current version of `sysopctl`. The current version is `v0.1.0`.

---

## Creating a Manual Page

You can create a manual page for `sysopctl` that users can access using `man sysopctl`.

### Steps:

1. Copy the `sysopctl.1` file to the appropriate directory:

```bash
sudo cp sysopctl.1 /usr/share/man/man1/
sudo mandb  # Update the man database
```

Now, users can access the manual page with:

```bash
man sysopctl
```

---

## Troubleshooting

### 1\. `-bash: ./sysopctl.sh: cannot execute: required file not found` No Commands Working

In general, the script is a DOS text file. Such files have CRLF line endings, and that extra CR (carriage-return) character at the end of the line is causing issues.

The specific issue it's causing is that the interpreter pathname on the #!-line now refers to something called `/bin/bash\r` (with the `\r` symbolising a carriage-return, which is a space-like character, so it's usually not visible). This file is not found, so this is what causes the error message.

To solve this, convert the script from a DOS text file to a Unix text file. If editing the scripts on Windows, we can probably do this by configuring the Windows text editor to create Unix text files, but we may also use the dos2unix utility, available for most common Unix variants.

> Bonus: I've been personally annoyed by this issue a couple of times

```bash
dos2unix <script_to_convert>
```

---

## Contributing

If you want to contribute to the development of `sysopctl`, feel free to submit issues or pull requests to the repository. Ensure your code adheres to best practices and is well-documented.

This README should be placed in the same directory as the script file or included in the GitHub repository if you are hosting the project online. It gives users clear instructions for installation, usage, and troubleshooting.
