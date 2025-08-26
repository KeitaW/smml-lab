#!/bin/bash
# Script to exclude p6-st-gpu-4 from all pending jobs in p6 partition

echo "Updating all pending jobs to exclude p6-st-gpu-4..."

# Get list of pending jobs
pending_jobs=$(squeue -p p6 -t PENDING -h -o "%i")

count=0
for jobid in $pending_jobs; do
    # Update each job to exclude p6-st-gpu-4
    sudo /opt/slurm/bin/scontrol update JobId=$jobid ExcNodeList=p6-st-gpu-4
    
    # Verify the update
    exclist=$(scontrol show job $jobid | grep ExcNodeList | cut -d'=' -f3 | cut -d' ' -f1)
    
    if [ "$exclist" = "p6-st-gpu-4" ]; then
        echo "✓ Job $jobid updated successfully"
        ((count++))
    else
        echo "✗ Job $jobid update failed or has ReqNodeList constraint"
    fi
done

echo ""
echo "Updated $count pending jobs to exclude p6-st-gpu-4"
echo "Jobs with specific ReqNodeList constraints were not updated."