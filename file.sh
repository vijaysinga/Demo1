    #!/bin/bash

    # Define the directory structure you want to create
    base_dir="Hello/Logs"
    sub_dir1="L1"
    sub_dir2="L2"
   
    file1="L1_13-09-2023.txt"
    file2="L1_23-09-2023.txt"
    file3="L2_13-09-2023.txt"
    file4="L2_23-09-2023.txt"

    # Create the base directory
    mkdir -p "$base_dir"

    # Create subdirectories within the base directory
    mkdir -p "$base_dir/$sub_dir1"
    mkdir -p "$base_dir/$sub_dir2"
 
    touch -t 202309131030.00 $base_dir/$sub_dir1/L1_13-09-2023.log
    touch -t 202309231030.00 $base_dir/$sub_dir1/L1_23-09-2023.log
    touch -t 202309131030.00 $base_dir/$sub_dir2/L2_13-09-2023.log
    touch -t 202309231030.00 $base_dir/$sub_dir2/L2_23-09-2023.log
    
#files = "$base_dir"
#cd "$files"
fil=("L1*.log" "L2*.log")
pwd
current_date=$(date +%Y-%m-%d)
retain_logs_from=$(date -d "$current_date -10 days" +%Y-%m-%d)
for file in "${base_dir[@]}"; do
   # find "$file" -name "$fil" ! -newermt "$current_date" -delete
    for file1 in "${file[@]}"; do
        #find "$file1" -name "$fil" ! -newermt "$retain_logs_from" -delete
        find "$file1" -name "$fil" -mtime +10 -exec rm -f {};
    done
done
        #for f in $(find Logs -name '*_13*.txt'); do rm $f; done
        #for f in $(find $WS -type f -mtime +10); do rm $f; done
