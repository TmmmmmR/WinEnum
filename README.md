# WinEnum

Toolkit to detected abnormal activities on a Windows machine.

# Usage 

1. Collect Volatile Data :

This toolkit is a custom CLI tool (based on sysinternals suite tools) to retrieve/collect informations from a Windows system. Here is a list of the specific types of volatile information  collected :

* System time
* Logged-on user(s)
* Remote Open files
* Network information
* Network connections
* Process information
* Process-to-port mapping
* Process memory
* Network status
* Running service information
* Open Shares

2. Data Analysis

Using the collected data we look for anomalous behavior that might be caused by a computer intrusion, such as:

* Unusual Processes and Services
* Unusual Files and Registry Keys
* Unusual Network Usage
* Unusual Scheduled Tasks
* Unusual Accounts
* Etc.

# References

* [SANS - DFIR - Know Abnormal ... Find Evil](https://digital-forensics.sans.org/media/poster_2014_find_evil.pdf)
