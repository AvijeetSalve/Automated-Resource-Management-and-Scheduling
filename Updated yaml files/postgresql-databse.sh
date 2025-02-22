Connect to the PostgreSQL database and create a table:

CREATE TABLE job_output (
    job_id INT PRIMARY KEY,
    user_name TEXT,
    output_data TEXT
);

===================================================================

Update your SLURM job scripts to insert data into PostgreSQL:

#!/bin/bash
#SBATCH --job-name=example-job
#SBATCH --output=output.txt

# Run your job
echo "Hello, SLURM!" > output.txt

# Insert job output into PostgreSQL
PGPASSWORD="slurm-password" psql -h postgresql.database.svc.cluster.local -U slurm -d slurmdb -c "
INSERT INTO job_output (job_id, user_name, output_data)
VALUES ($SLURM_JOB_ID, '$USER', '$(cat output.txt)');
