#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <job_id>"
    echo "Monitor SLURM job output and error logs using tail -f"
    exit 1
fi

JOB_ID=$1

# Get job information using scontrol
JOB_INFO=$(scontrol show job $JOB_ID)

if [ -z "$JOB_INFO" ]; then
    echo "Error: Could not find job ID $JOB_ID"
    echo "Make sure the job exists and you have permission to view it"
    exit 1
fi

# First try to get output/error files directly from scontrol
OUTPUT_FILE=$(echo "$JOB_INFO" | grep -oP '(?<=StdOut=)\S+')
ERROR_FILE=$(echo "$JOB_INFO" | grep -oP '(?<=StdErr=)\S+')

# If we got the files directly from scontrol, we're good
if [ -n "$OUTPUT_FILE" ] || [ -n "$ERROR_FILE" ]; then
    echo "Using log files from scontrol output"
else
    # Fallback: try to parse job script if it exists
    JOB_SCRIPT=$(echo "$JOB_INFO" | grep -oP '(?<=Command=)\S+')
    
    if [ -n "$JOB_SCRIPT" ] && [ -f "$JOB_SCRIPT" ]; then
        echo "Parsing job script: $JOB_SCRIPT"
        
        while IFS= read -r line; do
            # Skip non-SBATCH lines
            if [[ ! $line =~ ^#SBATCH ]]; then
                continue
            fi
            
            # Extract output file
            if [[ $line =~ --output=(.+) ]]; then
                OUTPUT_FILE="${BASH_REMATCH[1]}"
                # Replace %j with job ID
                OUTPUT_FILE="${OUTPUT_FILE//%j/$JOB_ID}"
            fi
            
            # Extract error file
            if [[ $line =~ --error=(.+) ]]; then
                ERROR_FILE="${BASH_REMATCH[1]}"
                # Replace %j with job ID
                ERROR_FILE="${ERROR_FILE//%j/$JOB_ID}"
            fi
        done < "$JOB_SCRIPT"
    fi
fi

# If no explicit error file, check if output and error are combined
if [ -z "$ERROR_FILE" ] && [ -n "$OUTPUT_FILE" ]; then
    echo "Monitoring combined output/error log: $OUTPUT_FILE"
    echo "Press Ctrl+C to stop monitoring"
    echo "=================================="
    tail -f "$OUTPUT_FILE"
    exit 0
fi

# Check if both files exist or will be created
if [ -z "$OUTPUT_FILE" ] && [ -z "$ERROR_FILE" ]; then
    echo "Error: No --output or --error directives found in $JOB_SCRIPT"
    exit 1
fi

echo "Job ID: $JOB_ID"
echo "Job Script: $JOB_SCRIPT"

if [ -n "$OUTPUT_FILE" ]; then
    echo "Output file: $OUTPUT_FILE"
fi

if [ -n "$ERROR_FILE" ]; then
    echo "Error file: $ERROR_FILE"
fi

echo "=================================="
echo "Press Ctrl+C to stop monitoring"
echo "=================================="

# Monitor both files using tail -f
if [ -n "$OUTPUT_FILE" ] && [ -n "$ERROR_FILE" ]; then
    # Monitor both files simultaneously
    {
        echo "=== OUTPUT LOG ==="
        tail -f "$OUTPUT_FILE" | sed 's/^/[OUT] /' &
        OUT_PID=$!
        
        echo "=== ERROR LOG ==="
        tail -f "$ERROR_FILE" | sed 's/^/[ERR] /' &
        ERR_PID=$!
        
        # Wait for interrupt
        trap "kill $OUT_PID $ERR_PID 2>/dev/null; exit" INT
        wait
    }
elif [ -n "$OUTPUT_FILE" ]; then
    tail -f "$OUTPUT_FILE"
elif [ -n "$ERROR_FILE" ]; then
    tail -f "$ERROR_FILE"
fi