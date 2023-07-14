# SubHunt

SubHunt is a subdomain enumeration tool that utilizes different tools and techniques to discover subdomains for a given domain.

## Description

SubHunt allows you to quickly enumerate subdomains using popular tools such as Amass, Sublist3r, Assetfinder, Subfinder, and crt.sh. It performs subdomain enumeration using multiple tools simultaneously to speed up the process.

## Features

- Concurrent execution of multiple subdomain enumeration tools for faster results
- Integration with popular tools like Amass, Sublist3r, Assetfinder, Subfinder, and crt.sh
- Removal of duplicate subdomains and sorting them alphabetically
- Customizable output file for storing the enumerated subdomains

## Prerequisites

- [Amass](https://github.com/OWASP/Amass)
- [Sublist3r](https://github.com/aboul3la/Sublist3r)
- [Assetfinder](https://github.com/tomnomnom/assetfinder)
- [Subfinder](https://github.com/projectdiscovery/subfinder)
- [crt.sh](https://crt.sh/)

Make sure you have installed these tools and they are available in your system's PATH.

## Usage
1. Clone the SubHunt repository and navigate to the SubHunt directory:

   ```bash
   git clone https://github.com/HA-M4HMUD/SubHunt.git
   cd SubHunt
2. Make the SubHunt.sh script executable:
   chmod +x SubHunt.sh
3. Run the script with the following command-line options:
./SubHunt.sh -d <domain> [-o <output_file>]


- `-d` or `--domain`: Specifies the domain to enumerate subdomains.
- `-o` or `--output`: (Optional) Specifies the output file to store the subdomains. Default: `subdomains.txt`.

## Examples

Enumerate subdomains for example.com and save the results to `subdomains.txt`:

./SubHunt.sh -d example.com

Enumerate subdomains for example.com and save the results to `output.txt`:

./SubHunt.sh -d example.com -o output.txt

## Disclaimer
This tool should be used responsibly and in compliance with the target's terms of service. The developers assume no liability and are not responsible for any misuse or damage caused by this tool.
