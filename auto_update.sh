#!/bin/bash

# Get today's date
today=$(date "+%m%d%Y")

# Set log directory
log_DIR="/var/log/update_log"

# Set log file
log_FILE="/var/log/update_log/update_${today}.log"

# Generate of log directory
if [ ! -d $log_DIR ]; then
    sudo mkdir ${log_DIR}
fi

# Generate of log file
if [ ! -e $log_FILE ]; then
    sudo touch ${log_FILE}
fi

# Function: Update processing
all_update () {
    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo apt-get autoremove -y
    sudo apt-get clean -y
    sudo apt-get autoclean -y
    sudo apt-get check -y
}

# Set start log output date/time format to mm/dd/yyyy hh:mm:ss
start_time=$(date '+%m/%d/%Y %T')

# Output of execution log heading (start)
echo "##### $start_time start update #####" | sudo tee -a ${log_FILE}

# Update process
all_update | sudo tee -a ${log_FILE}

# Set end log output date/time format to mm/dd/yyyy hh:mm:ss
end_time=$(date '+%m/%d/%Y %T')

# Output of execution log heading (end)
echo "###### $end_time end update ######" | sudo tee -a ${log_FILE}
