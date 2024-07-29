#!/bin/bash
 
# Number of requests to make
num_requests=1000
 
# Delay between requests (in seconds)
delay=0.1
 
# URL to test
url="http://myapp.local/frontend"
 
# Function to send HTTP requests
send_requests() {
  for ((i=1; i<=num_requests; i++))
  do
    curl -s -o /dev/null $url
    sleep $delay
  done
}
 
# Function to monitor HPA
monitor_hpa() {
  while true
  do
    kubectl get hpa
    sleep 5  # Adjust the interval as needed
  done
}
 
# Start sending requests in the background
send_requests &
 
# Monitor HPA in the foreground
monitor_hpa
