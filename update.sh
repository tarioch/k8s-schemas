#!/bin/bash

#echo "" > crds.yaml

for CRD in `kubectl get crd -o name`
do
	echo $CRD
#	kubectl get $CRD -o yaml >> crds.yaml
#	echo "---" >> crds.yaml
done

wget https://github.com/yannh/kubeconform/raw/master/scripts/openapi2jsonschema.py 

rm -rf schemas
mkdir schemas
cd schemas

python3 ../openapi2jsonschema.py ../crds.yaml

cd ..

#rm crds.yaml
rm openapi2jsonschema.py

