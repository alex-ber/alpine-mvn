#!/usr/bin/env bash

set -ex

echo "building maven-parent (and it's depenedieces)"
mvn clean install || true
mvn tomcat7:undeploy || true