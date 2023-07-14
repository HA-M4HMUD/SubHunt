# SubHunt

SubHunt is a subdomain enumeration tool that utilizes different tools and techniques to discover subdomains for a given domain.

## Description

SubHunt allows you to quickly enumerate subdomains using popular tools such as Amass, Sublist3r, Assetfinder, Subfinder, and crt.sh. It performs subdomain enumeration using multiple tools simultaneously to speed up the process.

## Features

- Enumerates subdomains using Amass, Sublist3r, Assetfinder, Subfinder, and crt.sh
- Executes subdomain enumeration tools concurrently for faster results
- Removes duplicate subdomains and sorts them alphabetically
- Saves the results in an output file

## Prerequisites

- [Amass](https://github.com/OWASP/Amass)
- [Sublist3r](https://github.com/aboul3la/Sublist3r)
- [Assetfinder](https://github.com/tomnomnom/assetfinder)
- [Subfinder](https://github.com/projectdiscovery/subfinder)
- [crt.sh](https://crt.sh/)

Make sure you have installed these tools and they are available in your system's PATH.

## Usage

./subenum.sh -d <domain> [-o <output_file>]


- `-d` or `--domain`: Specifies the domain to enumerate subdomains.
- `-o` or `--output`: (Optional) Specifies the output file to store the subdomains. Default: `subdomains.txt`.

## Examples

Enumerate subdomains for example.com and save the results to `subdomains.txt`:

./subenum.sh -d example.com

Enumerate subdomains for example.com and save the results to `output.txt`:

./subenum.sh -d example.com -o output.txt

## Disclaimer
This tool should be used responsibly and in compliance with the target's terms of service. The developers assume no liability and are not responsible for any misuse or damage caused by this tool.
