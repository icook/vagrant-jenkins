apt-proxy:
  cmd.run:
    - name: echo "Acquire::http { Proxy \"http://192.168.1.118:3142\"; };" > /etc/apt/apt.conf.d/02local_proxy
