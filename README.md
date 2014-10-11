## Introduction

Johns Hopkins Data Science Course
4th module - Exploratory Data Analysis - Week 1 - Course Project 1 - october 2014

by silviolgandrade

https://github.com/silviolgandrade/ExData_Plotting1

This git repo is a fork from the original by RDPeng.
Preserved the original README.md from author.
Insite that file there are the full instructons for this assignment, as varianbles names, links to download the files, etc.

## My peer: load the data and make the plots

## Inside each script file plotX.R there are the detailed steps to process the data and plotting.

This job asks only to use 2 days from a large data table, then in a first place I split in a smaller data table. This small file called "SelectedDays.txt" contains all data needed to plot the graphics.

There 4 PlotX.R files in this repo too, as the job asks for.

In each file, there are the same first steps: check if exist the smaller data table in the R workspace: in positive case, load this small file. Else, download the big data table from the internet, split and save the smaller data table, then plot its as request.

Therefore, any script PlotX.R can be used individually. If the small data table is in, is fast. Else, there are a time to download and split first.


## Reproduce the script

If you want to run this scripts, change the setwd command to your R workspace and simply run the script.
This don't check in your workspace if there a big data table called "household_power_consumption.txt" (or even the .zip file), because your file maybe cannot be an updated version, or maybe can be corrupted, etc.

The goal from this idea is check for the small splitted version. In this case, is probably to take a time to download the original file and split them. As the original file is big, and if your computer is so old, you can have problems with load of memory.