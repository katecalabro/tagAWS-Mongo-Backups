# TAG aws-mongo-backups

## Install
* Make sure you have the awscli installed if not go here [Installing the AWS Command Line Interface]
* Once the cli is installed follow the steps below.
1. Type `aws configure` into terminal and hit enter.
2. When asked for **AWS_ACCESS_KEY_ID** enter `AKIAJZCDUY7MTF4G4RWA`.
3. When asked for **AWS_SECRET_ACCESS_KEY** enter `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`.
4. When asked for **DEFAULT_REGION_NAME** just hit enter.
5. When asked for **DEFAULT_OUTPUT_FORMAT** just hit enter.

## Run
```python
python -u run.py > {{log-file-name}} &
```
* Example (log file name is aws-backups.logs)
```python
python -u run.py > aws-backups.logs &
```

[Installing the AWS Command Line Interface]: http://docs.aws.amazon.com/cli/latest/userguide/installing.html
