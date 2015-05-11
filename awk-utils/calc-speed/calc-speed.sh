#!/bin/bash

echo "======== stage 1 start ========"

awk 'BEGIN {} \
{if($4~/([0-9]?bytes\/sec)/) print $4}; {if($5~/([0-9]?bytes\/sec)/) print $5};  \
END{}' foo.txt | tee out1.txt

echo "======== stage 1 compete ========"

echo "======== stage 2 start ========"

awk '{if($1~/[0-9]?/) gsub(/\(/, "") gsub(/bytes\/sec\)/, "")}; {if($1~/[0-9]?/) print $1}' out1.txt | tee out2.txt

echo "======== stage 2 compete ========"

echo "======== stage 3 start ========"

awk 'BEGIN {tot=0} {tot+=$1} {everage=tot/FNR} END{print tot " , " FNR " , " everage }' out2.txt | tee result.txt

echo "======== stage 3 compete ========"

