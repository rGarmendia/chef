name "load-balancer"
description "Load balancer role for HAProxy"
run_list "recipe[myusers]","recipe[myhaproxy]"

