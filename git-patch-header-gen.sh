#!/bin/bash
#============================================================================
# Simple bash script to generate git format-patch style patches.
# **Use with caution as there is no error checking (TBD).**
#============================================================================

# 1. Generate patch mail header
from_msg=$1 # patch file name or git commit hash
from_date=`date +"%a %b %d %T %Y"`
from_user_name=`git config user.name`
from_user_email=`git config user.email`
date_now=`date +"%a, %d %b %Y %T %:z"`
subject=$2

patch_header=\
"\
From $from_msg $from_date
From: $from_user_name <$from_user_email>
Date: $date_now
Subject: [PATCH] $subject"

echo "$patch_header" # TODO redirect to t.hdr (tmp file).

# TODO
# 1. Generate diffstat to t.diffstat.
# 1. Generate diff to t.diff.
# 2. Cat t.hdr, t.diffstat and t.diff to t.patch with "\n===" separator.
