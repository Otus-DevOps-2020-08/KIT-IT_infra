#!/bin/bash

yc_instances_app=($(yc compute instance list | grep app | awk -F\| '{print $3 $6}'))
yc_instances_db=($(yc compute instance list | grep db |  awk -F\| '{print $3 $6}'))
