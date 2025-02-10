FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y \
    slurm-wlm munge libmunge2 libmunge-dev \
    vim curl python3 python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Create Slurm user and directories
RUN mkdir -p /var/spool/slurm/d 
RUN mkdir -p /var/log/slurm 
RUN mkdir -p /etc/slurm 
RUN chown -R slurm:slurm /var/spool/slurm /var/log/slurm

# Copy Slurm configuration (ensure you have slurm.conf and other required configs)
COPY slurm.conf /etc/slurm/slurm.conf
COPY cgroup.conf /etc/slurm/cgroup.conf
COPY gres.conf /etc/slurm/gres.conf
COPY cgroup_allowed_devices.conf /etc/slurm/cgroup_allowed_devices.conf

# Start Slurm daemons
CMD ["slurmctld", "-D"]

