---
layout: post
title:  "TIL, 2018-03-13, IAM S3."
date:   2018-03-13 17:37:26 +0800
categories: programming
summary: "Cloud Guru IAM and S3 parts. Cont. Domain Driven Design."
---

## Musings

- On Writing Software Well:
  - `Incineratable`
- [Guarding via a block](https://github.com/laser/ruby-micro-services-redis/blob/master/services/user_service/implementation.rb):

``` ruby
  def delete_user_by_id(id)
    guard { !!User.destroy(id) }
  end

  def guard
    begin
      yield
    rescue ActiveRecord::RecordNotFound => e
      raise Barrister::RpcException.new(101, e.message)
    rescue ActiveRecord::RecordInvalid => e
      raise Barrister::RpcException.new(100, e.message)
    end
  end
```

## A Cloud Guru

- IAM
  - Root account: The email you used to sign up for AWS.
  - Administrator Access: Same as root.
  - You'll only see the access keys when you start.
  - Example of other access: Just S3 read-only access, Glacier Read Only.
  - You can also create access for specific users or for groups.
  - Things to do:
    - Delete root access keys.
    - Activate MFA on the root account.
    - Create individual IAM users.
    - Use groups to assign permissions.
    - Apply an IAM password policy.
  - Roles:
    - Creating a role so that EC2 can access S3.
- Creating a Billing Alarm
  - CloudWatch, Billing, then set your region to N. Virginia (add notification for all regions), then you can check the email, after confirmation.
- IAM Summary
  - Users, groups, roles, policy documents (these are universal, and are JSON).
  - IAM is universal, it does not apply to regions at this time. The "root account" is simply the account created when you first set up your AWS account. It has complete Admin access.
  - New Users have NO permissions when they are first created.
  - New Users are assigned Access Key & Secret Access Keys. These are not interchangeable.
  - Set up MFA on your root account.
  - Create and customize your own password rotation policies.
- Quiz Questions
  - Power user: all AWS services, except management of groups/users within IAM.
  - Root has: Administrator Access.
  - Users and Policy Documents are configured globally.
  - Setting up an account requires an email address.
  - To secure IAM for both root and new users: Implement MFA for all accounts.

### S3

- S3 is object based-storage (for flat files). (vs blocked based, where you put your operating systems).
- 0 bytes to 5TB. There is unlimited storage.
- Files are stored in Buckets (folders).
- Names must be unique globally.
- URL: It's the `<REGION>.amazonaws.com/<NAME OF BUCKET>`.
- When you upload a file to S3, you will receive an HTTP CODE 200 if the upload was successful.
- Date Consistency Model for S3
  - Read after Write Consistency for PUTS of new Objects. (You get immediate consistency when you write).
  - Eventual consistency for overwrite PUTS and DELETES. (You don't get that when you UPDATE and DELETE).
- Object-based:
  - Key (Literally the name of the object.)
    - If things are stored with the same file names, you can add a salt so the files are stored in different places.
  - Value (Data, made up of a sequence of bytes).
  - Version
  - Metadata.
  - Sub-resources: Access control lists. Torrent.
- 99.9(% availability for S3.
- 99.999999999% durability (11 9's).
- Tiered storage available.
  - Normal (99.99% availability). Designed to sustain the loss of 2 facilities concurrently.
  - S3 - IA (Infrequently Accessed): For Data that is accessed less frequently, but requires rapid access when needed. Lower fee than S3, but you are charged a retrieval fee. Payslips, etc.
  - Reduced Redundancy Storage: Just 99.99% durability and 99% availability of objects. Can be used for thumbnails.
  - Glacier: Very cheap, but used for archival only. 3-5 hours to restore. $0.01 per gigabyte per month.
- Charges
  - Storage
  - Requests
  - Storage Management Pricing.
  - Data transfer (replication)
  - Transfer acceleration: Users upload to edge. Check it out on Google.
- Lifecycle management. Let's say after 30 days, change storage tier of the data.
- Versioning.
- Encryption
- Securing your data using Access Control Lists and Bucket Policies.
- **Read the S3 FAQ before taking the exam.**

- When creating a bucket.
  - By default, objects don't have public access.
  - You can add encryption.
  - You can tag objects in addition to the buckets.
  - Controlling:
    - Stuff.
    - AWS Policy generator (?)
  - Management:
- S3 Buckets
  - Buckets are a universal name space.
  - Uploading an object to S3 receives an HTTP 200 Code.
  - Tiers: S3, S3 - IA (Infrequently accessed), S3 Reduced Redundancy Storage.
  - Encryption
    - Client Side Encryption
    - Server Side Encryption
      - With Amazon S3 Managed Keys
      - With KMS
      - With Customer Provided Keys.
    - Control access to buckets with either a bucket ACL (Access Control List) or Bucket Policies.

- Versioning
  - Can't disable it, you can only suspend it. So storage costs can change often.
  - If you overwrite the object (same name), you can see versions and restore it. You can delete the object, download? You can delete the object, download?
  - Every time a file changes, both versions would be in S3.
  - Version control can be a bad use case for big files.
  - MFA delete: Meaning that people can't accidentally delete tings.
- Exam Tips
  - Stores all versions of an object.
  - Great backup tool.
  - Once enabled, versioning cannot be disabled, only suspended.
  - Integrates with Lifecycle rules.
  - Versioning MFA's Delete capability.

- Cross Region Replication
  - You need versioning to be present on both buckets (source and destination, possible to be in another region).
  - Regions must be unique. (Can't replicate to own region.)
  - If you are using things as a backup, then you can use S3 IA.
  - It's only new objects that can be replicated. You need to use a CLI. They can have just programmatic access, not sign in access.
  - You cannot replicate to multiple buckets or use daisy chain (triplicate?)
  - If this works, you can do `$ aws s3 ls` and `$ aws s3 cp --recursive s3://SOURCE s3:DESTINATION`.
  - Changing public settings: gets replicated.
  - Deleting: the deletion marker is replicated, but if you delete the deletion marker, it won't be replicated.

- Lifecycle management, IA S3, & Glacier Lab
  - Glacier is not available in SG and in Sao Paulo.
  - Actions: Moving to IA, Glacier, and Expire. You can choose the number of days before those happen.
    - IA requires 128KB and 30 days after creation.
    - Glacier: 30 days after IA, if relevant.
    - Permanently Delete.
  - Different action on current version, previous versions, and incomplete multipart uploads.
  - Glacier: Requires 90 days inside before you can actually delete things inside.
