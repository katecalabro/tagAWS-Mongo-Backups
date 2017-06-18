#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Steup AWS Creds
#
# aws configure
# AWS_ACCESS_KEY_ID=AKIAJZCDUY7MTF4G4RWA
# AWS_SECRET_ACCESS_KEY=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
# DEFAULT_REGION_NAME=None (just hit enter)
# DEFAULT_OUTPUT_FORMAT=None (just hit enter)

"""
Script that runs a MongoDB backup job periodically according
to the interval defined by the INTERVAL_NAME environment variable.
"""

"""
python -u run.py > aws-backups.logs &
"""

import time
import datetime
import subprocess
import functools
import traceback
import os

import schedule

BACKUP_SCRIPT_PATH = "/app/backup.sh"
BACKUP_INTERVAL = 1
BACKUP_TIME = "2:00"
TIME_FORMAT = "%H:%M"

def catch_exceptions(job_func):
    @functools.wraps(job_func)
    def wrapper(*args, **kwargs):
        try:
            job_func(*args, **kwargs)
        except:
            print(traceback.format_exc())

    return wrapper


@catch_exceptions
def backup_job():
    print("Executing backup at {}".format(datetime.datetime.now().isoformat()))
    backup_result = subprocess.check_output([BACKUP_SCRIPT_PATH])
    print(backup_result)
    print("Backup finished at {}".format(datetime.datetime.now().isoformat()))

if __name__ == "__main__":
    print("Starting periodic MongoDB backup at {}".format(datetime.datetime.now().isoformat()))
    print("Executing backups every {} day/s at {}".format(BACKUP_INTERVAL, BACKUP_TIME))
    schedule.every(BACKUP_INTERVAL).days.at(BACKUP_TIME).do(backup_job)
    while True:
        schedule.run_pending()
        time.sleep(1)
