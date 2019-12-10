name 'web'
description 'web server role'
run_list "role[base]","recipe[myusers]","recipe[workstation]","recipe[apache]"
default_attributes 'apache-test' => {
	'attribute1' => 'Hello from attribute1',
	'attribute2' => 'you are great!'
}
