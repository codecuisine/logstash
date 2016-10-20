import hvac
import os


vault_url = os.getenv("VAULT_URL")
vault_token = os.getenv("VAULT_TOKEN")
vault_path = "secret/server"
keys_and_files = {"crt": "/etc/logstash.crt",
                  "key": "/etc/logstash.key"}


for var in [vault_url, vault_token, vault_path]:
    print "VAR IS: %s" % var
client = hvac.Client(url=vault_url, token=vault_token)
response = client.read(vault_path)
print response
for k, f in keys_and_files.items():
    print "Placing %s at %s" % (k, f)
    with open(f, 'w') as outfile:
        outfile.write(response["data"][k])
