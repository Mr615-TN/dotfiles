#!/bin/bash

# Define your VM names
ATTACKER="blackarch-vm"
TARGET="windows-target"
NETWORK="Hacking-Lab"

case "$1" in
  start)
    echo "--- Starting Pentest Lab ---"
    # Start the isolated virtual network
    sudo virsh net-start $NETWORK 2>/dev/null
    
    # Start the VMs
    virsh start $ATTACKER
    echo "Waiting for attacker to initialize..."
    sleep 5
    virsh start $TARGET
    echo "Lab is UP."
    ;;
  stop)
    echo "--- Shutting Down Lab ---"
    # Gracefully shut down VMs
    virsh shutdown $TARGET
    virsh shutdown $ATTACKER
    
    # Wait for them to stop before killing the network
    echo "Waiting for clean shutdown..."
    sleep 10
    sudo virsh net-destroy $NETWORK
    echo "Lab is DOWN."
    ;;
  *)
    echo "Usage: ./lab.sh {start|stop}"
    ;;
esac
