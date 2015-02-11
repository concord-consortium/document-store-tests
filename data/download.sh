SESSION="Cookie: _documentstore_session=cllyVFppNnpCcVdUd0U2eG4xR2F0UnovZGNscFZQL2JhSVMwY25zV204alNIb05ZdW5OOG9aeG1UODF2SnIra2wrVjlxOTVmb2pMaTFESTkySFhJY3RmODNwSkVpenh3bkdaNXd0SThLRmVrSG5LdWllckVvVWRGQkxacGJJYUZUNUNHZVAxT1hyY0ZkVjQ2S2NFTjl0ckVleTVkS1RHMGdvQ1lSbmVxWWwwQ05mdmkxUlNQVnVZWmhpNC9SWkc1STlQaVdvS3lnUXJzdXE1dEVOUmVLUjM0ZDFvR3VoUCtqT1JHRU1mUE1lTzVVT3o1c3dTVzI5Z29nQkRaVEI5SDBHK1k3SFJTSm1PbHRpc1dkZmt3SkxmQVhTOXRnT1ZxUHExdkJoN0hIRUNKZHg1S2M0Z3pnRWJCbHFBV2hZTEM0eGIwVWtwc1k4UkZMck1VQkdUUFdPZlMySTBIR0s0dURXOWxmNi9pTHFXMzR2VG9VQTV2eFFjdytHbXRuTnNWLS1PTlNWWEF1TWsweWRsYjk2RzI0ak9BPT0%3D--e5ef5b64f955a54ed6c31153cb8dd417b642d57c"
SERVER="doc.local"

# First, brute-force download the files
for i in $(seq -f "%03g" 1 999); do
  wget --no-cookies --header="$SESSION" -O document_$i.json http://$SERVER/document/open?recordid=$i
done

# delete the zero-length files
find . -size  0 -print0 |xargs -0 rm

# rename them sequentially
a=1
for i in document_*; do
  new=$(printf "document_%03d.json" "$a")
  mv -- "$i" "$new"
  let a=a+1
done
