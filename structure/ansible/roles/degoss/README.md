# degoss testing

An example run against a system. 
```
ansible-playbook  -u isre -i ansible/inventory/ec2.py -e variable_host=tag_Name_kibana_hub_grindr_io -e project=hubs/hub1/resources/kibana -e tests=${PWD}/hubs/hub1/resources/kibana/tests/goss.yaml --force-handlers ansible/degoss.yml
```
