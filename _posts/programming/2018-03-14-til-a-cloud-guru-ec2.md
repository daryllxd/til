---
layout: post
title:  "TIL, 2018-03-14 Cloud Guru EC2"
date:   2018-03-14 16:09:57 +0800
categories: programming
summary: "EC2 instance types, `Exception#full_message`, adding React Dev tools."
---

- [Ruby adds `Exception#full_message` method.](https://blog.bigbinary.com/2018/03/13/ruby-2-5-adds-exception-full_message-method.html)
- React Dev Tools!

## A Cloud Guru

- Amazon's Elastic Compute Cloud (Amazon EC2) is a web service that provides resizable compute capacity in the cloud.
- Amazon EC2 reduces the time requires to obtain and boot new server instances to minutes, allowing you to quickly scale capacity, both up and down, as your computing requirements change. Basically, VMs in the cloud. Rack and stack!
- On-Demand: Fixed rate by the hour (by the second for Linux) with no commitment.
- Reserved: Provide you with a capacity, 1-3 year terms.
  - Standard: Up to 75%.
  - Convertible: Up to 54% off, you can change as long as equal or greater value.
  - Scheduled: able to launch within the time windows you reserve.
- Spot: Enable you to bid whatever price you want for instance capacity, providing for even greater savings.
  - Flexible start and end times.
  - Applications that are only feasible at very low compute prices. For big data stuff?
- Dedicated hosts: Physical EC2 server dedicated for your use. You can use your existing server-bound software licenses.
  - If no multi-tenant virtualization.

### EC2 Instance Types

- D2: Dense storage, for file servers/Data warehousing/Hadoop.
- R4: Memory optimized, for memory-intensive apps/DBs.
- M4: General purpose, for application servers.
- C4: Compute optimized.
- G2: Graphics.
- I2: High speed storage, NoSQL, data warehousing.
- F1: Field programmable gate array, hardware acceleration for your code.
- **T2: Lowest cost, general purpose, for web servers/small databases.** This is what we'll use.
- P2: Graphics/general purpose. ML, Bitcoin mining.
- X1 (Extreme Ram): Memory Optimized. SAP HANA/Apache Spark.

### EBS

- Allows you to create storage volumes and attach them to Amazon EC2 instances. Once attached, you can create a file system on top of these volumes, run a database, or use them in any other way you would use a block device.
- Volume types (SSD/non-sequential):
  - General Purpose SSD: balances both price and performance.
  - Provisioned IOPS SSD: for I/O intensive IOPS.
- Magnetic storage (
  - Throughput op
- Cold HDD.
  - File server, lowest cost storage, cannot be boot volume.
- Magnetic (Standard):
  - Lowest cost per gig.

- Alexa skill?

- Tips:
  - On demand vs spot vs reserved, dedicated hosts.
  - With spot instances, if you terminate the instance, you pay for the hour.
  - If AWS terminates, you get the hour it was terminated in for free.
  - EBS:
    - SSD, General Purpose (GP2), up to 10K IOPS (inputs/outputs per second).
    - SSD, Provisioned IOPS (IO1), more than 10K IOPS.
    - HDD, Throughput Optimized - ST1, frequently accessed workloads.
    - HDD, Cold: SC1, less frequently accessed data.
    - HDD, Magnetic, Standard: cheap, infrequently accessed storage.
  - You cannot mount 1 EBS volume to multiple EC2 instances, instead use EFS.

- Launching instances:
  - Amazon Machine Image/AMI: Snapshots of virtual machines that you can then provision and boot up (Amazon Linux, Ubuntu Server, SUSE Enterprise, Windows).
  - Tenancy: Dedicated hosts.
  - VPC: A virtual data center.
  - Subnet: Depending on the availability zone. You can't have a subnet in 2 availability roles.
  - Shutdown behavior: Do I kill the instance or stop it?
  - Termination protection: To not accidentally kill it.
  - Monitoring: If off, CloudWatch checks every 5 minutes. If on, every 1 minute, also there's a charge.
  - Adding storage: For root.
    - By default, when you delete an EC2 instance, the volume is deleted.
    - Root device = where you boot the OS from.
    - Tagging: good.
  - Security group: just a firewall. Add SSH, HTTP, HTTPS. You can restrict SSH to your IP address, but only if you are not on a cloud.
  - `chmod 400 KEY` to allow you to edit the key.
  - `ssh ... -i KEY_PAIR`.
  - `sudo su`, `yum update -y`.
  - `yum install httpd` to install Apache.
  - `service httpd start`.
