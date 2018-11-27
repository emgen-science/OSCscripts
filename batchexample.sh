###########################################
#######BASE EXAMPLE SCRIPT FOR OSC#########
###########EMILY JENNINGS MORGAN###########
# For Running on Oakley
#PBS -N PUT A PROJECT NAME HERE
#PBS -l nodes=1:ppn=12
#PBS -m abe -M EMAIL ADDRESS HERE FOR ALERTS
#PBS -l walltime=48:00:00
#PBS -l mem=46GB
ulimit -s unlimited
##########################################
#Prepare to run
#make any directories here that you will need for your program to run #if you need a results folder, make that here
#if you need a folder in the scratch directory, make that here
#literally any folder you need, make it here.
mkdir /fs/scratch/\ #this is the working scratch directory on osc
		projectID/\ #this is the project ID you were assigned for your account
		USERNAME/\ #this is your username
		DESIREDFOLDERNAME #name your folder something useful

#if you have large files that you need to move, do that here.
cp /path/to/directory/of/file.extension /path/to/destination/folder/

#move to the working directory for project at hand
cd /path/to/your/scratch/folder/you/are/working/in/

#you will want to load modules of programs that are required to run your job here.
module load java
module load samtools

#if you have programs that you installed locally, and your job needs them
#export the path to it so the computer can find it-do that here
export PATH=${PATH}:${HOME}/bin:$HOME/PATHTOYOURPROGRAMOFCHOICE:/bin:$PATH #this is the folders your program is in
export PATH=${PATH}:${HOME}/bin:$HOME/PATHTOYOURPROGRAMOFCHOICE/bin:/bin:$PATH #usually you will need this too

#here is the actual executable part of the script
#see the user guide for whatever your program is you are running. #this is my old trinity script from another project

#this is the command that actually runs your program
perl PATH/TO/YOUR/PROGRAM/fast-plast.pl \
--1 forwardreads.fastq.gz \ #can also be a comma separated list
--2 reversereads.fastq.gz \ #can also be a comma separated list
--name PROJECTNAME \ #pick a project name. will be used to name folders and files. do not use dashes or spaces
--bowtie_index NAME \ #whatever library you want to use as your reference
--coverage_analysis \ #run coverage analysis
--clean light \ #will remove unneeded intermediate files but not everything
