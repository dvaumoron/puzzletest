#!/usr/bin/env bash

./deploy/create_fake_cluster.sh
./deploy/create_configmaps.sh
./deploy/deploy_services.sh
