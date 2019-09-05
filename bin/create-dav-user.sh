#!/bin/bash

echo "Enter the URL to your DAV server:"
read url

echo "Enter the username:"
read username

echo $url >> dav_url
echo $username >> dav_username

