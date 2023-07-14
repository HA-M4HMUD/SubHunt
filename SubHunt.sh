#!/bin/bash

# Default values
domain=""
output_file="subdomains.txt"

# Function to enumerate subdomains using different tools
enumerate_subdomains() {
    echo "Enumerating subdomains using different tools..."

    # Amass
    echo "Amass..."
    amass enum --passive -d "$domain" 2>/dev/null | pv -l -s $(amass enum --passive -d "$domain" 2>/dev/null | wc -l) -W -N "Amass" >> "$output_file" &
    pid1=$!

    # Sublist3r
    echo "Sublist3r..."
    sublist3r -v -t 50 -d "$domain" -o "$output_file" >/dev/null 2>&1 &
    pid2=$!

    # Assetfinder
    echo "Assetfinder..."
    assetfinder -subs-only "$domain" 2>/dev/null | pv -l -s $(assetfinder -subs-only "$domain" 2>/dev/null | wc -l) -W -N "Assetfinder" >> "$output_file" &
    pid3=$!

    # Subfinder
    echo "Subfinder..."
    subfinder -d "$domain" 2>/dev/null | pv -l -s $(subfinder -d "$domain" 2>/dev/null | wc -l) -W -N "Subfinder" >> "$output_file" &
    pid4=$!

    # crt.sh
    echo "crt.sh..."
    curl -s "https://crt.sh/?q=%25.$domain" | grep -oP '([a-zA-Z0-9]+\.[a-zA-Z]+\.?[a-zA-Z]*)' 2>/dev/null | pv -l -s $(curl -s "https://crt.sh/?q=%25.$domain" | grep -oP '([a-zA-Z0-9]+\.[a-zA-Z]+\.?[a-zA-Z]*)' 2>/dev/null | wc -l) -W -N "crt.sh" >> "$output_file" &
    pid5=$!

    # Wait for all background jobs to finish
    wait $pid1 $pid2 $pid3 $pid4 $pid5

    # Sort and remove duplicates
    sort -u -o "$output_file" "$output_file"

    echo "Subdomain enumeration completed. Results saved in $output_file."
}

# Function to display script usage
usage() {
    echo "Usage: $0 -d domain [-o output_file]"
    echo "Options:"
    echo "  -d   Domain to enumerate subdomains"
    echo "  -o   Output file to store the subdomains (default: subdomains.txt)"
    exit 1
}

# Process command-line options
while getopts ":d:o:h" opt; do
    case $opt in
        d)
            domain="$OPTARG"
            ;;
        o)
            output_file="$OPTARG"
            ;;
        h)
            usage
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            usage
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            usage
            ;;
    esac
done

# Check if domain is provided
if [ -z "$domain" ]; then
    echo "Domain is required."
    usage
fi

# Main script execution
enumerate_subdomains
