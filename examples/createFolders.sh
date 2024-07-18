# Read each line from filelist.txt
base_dir="/home/hrishikeshnk/github.copy/deepxde/examples/pinn_forward/"


while IFS= read -r filename; do
    # Remove leading and trailing whitespace (if any)
    filename=$(echo "$filename" | tr -d '[:space:]')

    # Remove file extension (.py) from the filename
    filename_without_extension="${filename%.py}"
    #echo "$filename"
    # Create a directory for the Python script if it doesn't exist
    #mkdir -p "$filename_without_extension"
    
    # Move the Python file to its corresponding folder
    mv "$base_dir$filename" "$base_dir$filename_without_extension/$filename"
done < filelist