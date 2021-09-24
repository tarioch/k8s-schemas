#!/bin/bash

kubectl get crd -o yaml > crds.yaml

rm -rf schemas
mkdir schemas
cd schemas

python3 ../openapi2jsonschema.py ../crds.yaml

python3 ../openapi2jsonschema.py https://doc.crds.dev/raw/github.com/jaegertracing/jaeger-operator

cd ..

rm crds.yaml

