# filemgr

`filemgr` is a versatile Bash script designed for managing files and directories on a Linux system. It offers functionalities to search for files and directories, as well as to delete or modify them. This tool is useful for system administrators and power users who need to perform batch operations on files and directories.

## Features

- **File Management**: 
  - Search for specific files.
  - View a list of files matching the search criteria.
  - Select a file from the list to delete.

- **Directory Management**:
  - Search for specific directories.
  - View a list of directories matching the search criteria.
  - Select a directory from the list to delete.

## Prerequisites

- **Bash Shell**: The script is designed to run in a Bash shell environment.
- **`find` Command**: Required for searching directories.
- **`locate` Command**: Used for locating files and directories.

## Usage

1. **Clone or Download the Repository:**
   - Clone the repository using Git:
     ```bash
     git clone https://github.com/username/filemgr.git
     ```
   - Or download the script file directly from the [GitHub repository](https://github.com/Diablooo999/filemgr).

2. **Make the Script Executable:**
   - Change the script's permissions to make it executable:
     ```bash
     chmod +x filemgr
     ```

3. **Run the Script:**
   - Execute the script from the terminal:
     ```bash
     sudo ./filemgr
     ```

4. **Follow the Prompts:**
   - **Select Option (F/D)**: Choose whether to manage files or directories.
   - **Enter Search Term**: Provide the name or pattern of the file or directory you want to track.
   - **Select Action**: Choose a file or directory from the search results and confirm deletion if needed.

