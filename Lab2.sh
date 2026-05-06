mkdir demo
cd demo
echo "Hello Cloud Shell">hello.txt
cat hello.txt
chmod +x hello.txt
ls -l
cd ..

#File & Directory Management
mkdir test     # Create directory
rmdir test    # Delete empty directory
rm file.txt    # Delete file
rm -r folder      # Delete folder recursively
cp a.txt b.txt      # Copy file
mv a.txt folder/     # Move or rename file

#Viewing & Editing Files
cat file.txt       # View file content
less file.txt     # Scroll view
head file.txt      # First 10 lines
tail file.txt         # Last 10 lines
nano file.txt       # Simple editor
vi file.txt          # Advanced editor

#System Information
whoami       # Current user
uname -a       # OS details
df -h           # Disk usage
du -sh *         # Folder sizes
free -h          # Memory usage
uptime        # System running time

#Environment Variables & Shell
env          # List environment variables
echo $HOME       # Print variable
export MYVAR=123        # Set variable
history        # Command history
clear         # Clear terminal

#exploring the gcloud commands
gcloud auth list      #Check active account
gcloud config list project     #Check active project
gcloud help         #get help
gcloud compute --help         #get help
gcloud projects list        #list projects

#exploring cloud Shell editor
cloudshell edit a.txt        #opens cloud shell editor 
cat a.txt        #views file content 
cloudshell edit test.py  #opens cloud shell editor
python3 test.py   #executes the file from terminal 
gcloud compute instances list     #list VM instances
gcloud compute instances create my-vm \ --zone=us-central1-a      #create a VM
gcloud compute instances delete my-vm \ --zone=us-central1-a      #deletes a VM
gcloud storage buckets list      #list buckets 
gcloud storage buckets create gs://my-bucket-name     #create a bucket
gcloud app deploy    #deploy app
gcloud app browse     #view app
gcloud iam service-accounts list     #list service accounts
